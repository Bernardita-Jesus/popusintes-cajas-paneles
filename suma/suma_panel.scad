// suma_panel.scad

include <../comun/constantes.scad>
include <../comun/panel.scad>
include <../comun/versiones.scad>

module suma_panel() {
  panel(MODULO_ANCHO * SUMA_HP, texto = SUMA_TEXTO, version = SUMA_VERSION);
}
