// suma_caja.scad

include <../comun/caja.scad>
include <../comun/versiones.scad>

module suma_caja() {
  caja(SUMA_HP, SUMA_TEXTO, VERSION);
}
