// noti_panel.scad
// panel en blanco
// sin parametros, entradas, salidas ni luces.
// el panel fisico solo lleva los tornillos de montaje

include <../comun/constantes.scad>
include <../comun/panel.scad>
include <../comun/tornillos.scad>
include <../comun/texto.scad>
include <../comun/versiones.scad>

module noti_panel() {
  ancho = MODULO_ANCHO * NOTI_HP;
  alto  = MODULO_ALTURA_3U;

  difference() {
    panel_base(ancho, alto);

    union() {
      agujeros_tornillos(ancho, alto);
      grabados_panel(NOTI_TEXTO, VERSION, ancho, alto);
    }
  }
}
