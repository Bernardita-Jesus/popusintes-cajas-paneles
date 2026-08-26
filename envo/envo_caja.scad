// envo_caja.scad

include <../comun/caja.scad>
include <../comun/versiones.scad>

module envo_caja() {
  caja(ENVO_HP, ENVO_TEXTO, ENVO_VERSION);
}
