// relo_caja.scad

include <../comun/caja.scad>
include <../comun/versiones.scad>

module relo_caja() {
  caja(RELO_HP, RELO_TEXTO, VERSION);
}
