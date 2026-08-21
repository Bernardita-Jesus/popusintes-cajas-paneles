// recta_panel.scad

include <../comun/constantes.scad>
include <../comun/panel.scad>
include <../comun/versiones.scad>

module recta_panel() {
  panel(MODULO_ANCHO * RECTA_HP, texto = RECTA_TEXTO, version = RECTA_VERSION);
}
