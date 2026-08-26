// secu_panel.scad

include <../comun/constantes.scad>
include <../comun/panel.scad>
include <../comun/versiones.scad>

module secu_panel() {
  panel(MODULO_ANCHO * SECU_HP, texto = SECU_TEXTO, version = SECU_VERSION);
}
