// suma_panel.scad
// rack/src/Suma.cpp todavia no implementa parametros, entradas, salidas
// ni luces (sumadora/mezcladora pendiente). el panel fisico por ahora
// solo lleva los tornillos de montaje. actualizar cuando Suma.cpp tenga
// controles reales

include <../comun/constantes.scad>
include <../comun/panel.scad>
include <../comun/tornillos.scad>
include <../comun/texto.scad>
include <../comun/versiones.scad>

module suma_panel() {
  ancho = MODULO_ANCHO * SUMA_HP;
  alto  = MODULO_ALTURA_3U;

  difference() {
    panel_base(ancho, alto);

    union() {
      agujeros_tornillos(ancho, alto, ambos_lados = false);
      grabados_panel(SUMA_TEXTO, SUMA_VERSION, ancho, alto);
    }
  }
}
