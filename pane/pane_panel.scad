// pane_panel.scad

include <../comun/constantes.scad>
include <../comun/panel.scad>
include <../comun/versiones.scad>

module pane_panel() {
  panel(MODULO_ANCHO * PANE_HP, texto = PANE_TEXTO, version = PANE_VERSION);
}
