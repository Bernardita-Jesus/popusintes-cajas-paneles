// rerelo_caja.scad

include <../comun/caja.scad>
include <../comun/versiones.scad>

module rerelo_caja() {
  caja(RERELO_HP, RERELO_TEXTO, VERSION);
}
