// compa_panel.scad

include <../comun/constantes.scad>
include <../comun/panel.scad>
include <../comun/versiones.scad>

module compa_panel() {
  panel(MODULO_ANCHO * COMPA_HP, texto = COMPA_TEXTO, version = COMPA_VERSION);
}
