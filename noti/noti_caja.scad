// noti_caja.scad

include <../comun/caja.scad>
include <../comun/versiones.scad>

module noti_caja() {
  caja(NOTI_HP, NOTI_TEXTO, VERSION);
}
