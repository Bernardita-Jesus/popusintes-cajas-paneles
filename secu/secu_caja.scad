// secu_caja.scad

include <../comun/caja.scad>
include <../comun/versiones.scad>

module secu_caja() {
  caja(SECU_HP, SECU_TEXTO, SECU_VERSION);
}
