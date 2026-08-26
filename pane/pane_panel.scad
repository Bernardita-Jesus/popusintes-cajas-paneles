// pane_panel.scad
// rack/src/Pane.cpp es un panel en blanco: sin parametros, entradas,
// salidas ni luces. el panel fisico solo lleva los tornillos de montaje

include <../comun/constantes.scad>
include <../comun/panel.scad>
include <../comun/tornillos.scad>
include <../comun/texto.scad>
include <../comun/versiones.scad>

module pane_panel() {
  ancho = MODULO_ANCHO * PANE_HP;
  alto  = MODULO_ALTURA_3U;

  difference() {
    panel_base(ancho, alto);

    union() {
      agujeros_tornillos(ancho, alto);
      grabados_panel(PANE_TEXTO, PANE_VERSION, ancho, alto);
    }
  }
}
