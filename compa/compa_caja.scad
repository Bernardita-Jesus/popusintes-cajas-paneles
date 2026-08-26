// compa_caja.scad

include <../comun/caja.scad>
include <../comun/versiones.scad>

module compa_caja() {
  caja(COMPA_HP, COMPA_TEXTO, VERSION);
}
