// envo_panel.scad

include <../comun/constantes.scad>
include <../comun/panel.scad>
include <../comun/versiones.scad>

module envo_panel() {
  panel(MODULO_ANCHO * ENVO_HP, texto = ENVO_TEXTO, version = ENVO_VERSION);
}
