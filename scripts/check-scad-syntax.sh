#!/usr/bin/env bash
# validates every .scad file parses/evaluates by exporting it to csg,
# which exercises openscad's parser without needing a full CGAL render.
set -uo pipefail

status=0

while IFS= read -r -d '' file; do
  out="$(mktemp).csg"
  if ! openscad -o "$out" "$file" 2>/tmp/openscad-err.log; then
    echo "$file: failed to parse/evaluate"
    cat /tmp/openscad-err.log
    status=1
  fi
  rm -f "$out" /tmp/openscad-err.log
done < <(find . -iname "*.scad" -print0)

exit $status
