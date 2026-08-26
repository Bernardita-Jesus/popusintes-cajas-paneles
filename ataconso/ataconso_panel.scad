// ataconso_panel.scad
// agujeros copiados del layout de rack/src/Ataconso.cpp: columna unica
// centrada (ataconso no tiene canales a/b), perilla + entrada de
// frecuencia, perilla + entrada de timbre, salida y luz

include <../comun/constantes.scad>
include <../comun/panel.scad>
include <../comun/componentes.scad>
include <../comun/tornillos.scad>
include <../comun/texto.scad>
include <../comun/espaciado.scad>
include <../comun/versiones.scad>

module ataconso_panel() {
  ancho = MODULO_ANCHO * ATACONSO_HP;
  alto  = MODULO_ALTURA_3U;

  COLUMNA = 0.5;

  FRECUENCIA_Y = 0.20;
  ENTRADA_FRECUENCIA_Y = FRECUENCIA_Y + ESPACIADO_DELTA_Y_BOTON_ENTRADA;

  TIMBRE_Y = 0.45;
  ENTRADA_TIMBRE_Y = TIMBRE_Y + ESPACIADO_DELTA_Y_BOTON_ENTRADA;

  SALIDA_Y = 0.90;
  LUZ_Y = SALIDA_Y - ESPACIADO_DELTA_Y_SALIDA_LUZ;

  difference() {
    panel_base(ancho, alto);

    union() {
      agujeros_tornillos(ancho, alto);

      agujero_perilla_grande(ancho, alto, COLUMNA, FRECUENCIA_Y);
      agujero_jack(ancho, alto, COLUMNA, ENTRADA_FRECUENCIA_Y);

      agujero_perilla_grande(ancho, alto, COLUMNA, TIMBRE_Y);
      agujero_jack(ancho, alto, COLUMNA, ENTRADA_TIMBRE_Y);

      agujero_jack(ancho, alto, COLUMNA, SALIDA_Y);
      agujero_led(ancho, alto, COLUMNA, LUZ_Y);

      grabados_panel(ATACONSO_TEXTO, ATACONSO_VERSION, ancho, alto);
    }
  }
}
