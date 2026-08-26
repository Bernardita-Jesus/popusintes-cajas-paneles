// ataconso_panel.scad

include <../comun/constantes.scad>
include <../comun/panel.scad>
include <../comun/versiones.scad>

module ataconso_panel() {
  panel(MODULO_ANCHO * ATACONSO_HP, texto = ATACONSO_TEXTO, version = ATACONSO_VERSION);
}
