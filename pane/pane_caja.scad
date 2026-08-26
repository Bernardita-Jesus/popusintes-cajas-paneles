// pane_caja.scad

include <../comun/caja.scad>
include <../comun/versiones.scad>

module pane_caja() {
  caja(PANE_HP, PANE_TEXTO, PANE_VERSION);
}
