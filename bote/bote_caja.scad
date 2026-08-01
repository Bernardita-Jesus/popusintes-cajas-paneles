// bote_caja.scad

include <../comun/caja.scad>
include <../comun/versiones.scad>

module bote_caja(hp = 1) {
  caja(hp, BOTE_TEXTO, BOTE_VERSION);
}
