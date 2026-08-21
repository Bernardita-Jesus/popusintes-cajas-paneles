#!/usr/bin/env bash
# renderiza cada caja y panel a stl/. cada pieza es un modulo que su
# archivo .scad fuente llama de a uno (ver recta.scad / relo.scad, que
# alternan entre _caja y _panel), asi que esto genera un archivo
# temporal por pieza que incluye la fuente y llama al modulo, lo
# renderiza con openscad, y despues borra el temporal.
#
# uso:
#   ./scripts/exportar-stl.sh              exporta todas las piezas
#   ./scripts/exportar-stl.sh recta relo   exporta solo piezas que matcheen "recta" o "relo"
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

raiz_repo="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
directorio_stl="$raiz_repo/stl"
mkdir -p "$directorio_stl"

# nombre:directorio:archivo-fuente:llamada-al-modulo
piezas=(
  "bote_caja:bote:bote_caja.scad:bote_caja(40)"
  "recta_caja:recta:recta_caja.scad:recta_caja()"
  "recta_panel:recta:recta_panel.scad:recta_panel()"
  "relo_caja:relo:relo_caja.scad:relo_caja()"
  "relo_panel:relo:relo_panel.scad:relo_panel()"
  "rerelo_caja:rerelo:rerelo_caja.scad:rerelo_caja()"
  "rerelo_panel:rerelo:rerelo_panel.scad:rerelo_panel()"
)

filtros=("$@")
estado=0
inicio=$(date +%s)

for pieza in "${piezas[@]}"; do
  IFS=":" read -r nombre directorio fuente llamada <<< "$pieza"

  if [ "${#filtros[@]}" -gt 0 ]; then
    coincide=0
    for filtro in "${filtros[@]}"; do
      [[ "$nombre" == *"$filtro"* ]] && coincide=1
    done
    [ "$coincide" -eq 0 ] && continue
  fi

  temporal="$raiz_repo/$directorio/.build-$nombre.scad"
  trap 'rm -f "$temporal"' EXIT

  {
    echo '$fn = 32;'
    echo "include <./$fuente>"
    echo "$llamada;"
  } > "$temporal"

  salida="$directorio_stl/$nombre.stl"
  echo "Exportando $salida..."

  if ! "$openscad" -o "$salida" --export-format binstl --quiet "$temporal"; then
    echo "$nombre: fallo el render" >&2
    estado=1
  fi

  rm -f "$temporal"
  trap - EXIT
done

fin=$(date +%s)
echo
echo "Listo en $((fin - inicio))s"

exit $estado
