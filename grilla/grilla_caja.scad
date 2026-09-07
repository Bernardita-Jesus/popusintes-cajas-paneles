// grilla_caja.scad

include <../comun/caja.scad>
include <../comun/versiones.scad>

module grilla_caja(hp = GRILLA_HP_ANCHA) {
  caja(hp, GRILLA_TEXTO, VERSION);
}
