#!/usr/bin/env bash
# renders every caja and panel to stl/. each part is a module that its
# source .scad file only calls one at a time (see recta.scad / relo.scad,
# which toggle between _caja and _panel), so this generates a small
# throwaway wrapper per part that includes the source and calls the
# module, renders it with openscad, then removes the wrapper.
#
# usage:
#   ./scripts/build-stls.sh              exporta todas las piezas
#   ./scripts/build-stls.sh recta relo   exporta solo piezas que matcheen "recta" o "relo"
set -uo pipefail

openscad="${OPENSCAD:-}"

if [ -z "$openscad" ]; then
  if command -v openscad >/dev/null 2>&1; then
    openscad="openscad"
  elif [ -x "/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD" ]; then
    openscad="/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD"
  fi
fi

if [ -z "$openscad" ] || ! command -v "$openscad" >/dev/null 2>&1; then
  echo "openscad no encontrado (definir OPENSCAD con la ruta al binario)" >&2
  exit 1
fi

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
stl_dir="$repo_root/stl"
mkdir -p "$stl_dir"

# nombre:directorio:archivo-fuente:llamada-al-modulo
parts=(
  "bote_caja:bote:bote_caja.scad:bote_caja(40)"
  "recta_caja:recta:recta_caja.scad:recta_caja()"
  "recta_panel:recta:recta_panel.scad:recta_panel()"
  "relo_caja:relo:relo_caja.scad:relo_caja()"
  "relo_panel:relo:relo_panel.scad:relo_panel()"
)

filters=("$@")
status=0
start=$(date +%s)

for part in "${parts[@]}"; do
  IFS=":" read -r name dir source call <<< "$part"

  if [ "${#filters[@]}" -gt 0 ]; then
    matched=0
    for filter in "${filters[@]}"; do
      [[ "$name" == *"$filter"* ]] && matched=1
    done
    [ "$matched" -eq 0 ] && continue
  fi

  wrapper="$repo_root/$dir/.build-$name.scad"
  trap 'rm -f "$wrapper"' EXIT

  {
    echo '$fn = 32;'
    echo "include <./$source>"
    echo "$call;"
  } > "$wrapper"

  out="$stl_dir/$name.stl"
  echo "Exportando $out..."

  if ! "$openscad" -o "$out" --export-format binstl --quiet "$wrapper"; then
    echo "$name: fallo el render" >&2
    status=1
  fi

  rm -f "$wrapper"
  trap - EXIT
done

end=$(date +%s)
echo
echo "Listo en $((end - start))s"

exit $status
