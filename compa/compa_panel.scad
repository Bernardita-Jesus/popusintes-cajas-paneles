// compa_panel.scad
// agujeros copiados del layout de rack/src/Compa.cpp: sin perillas,
// solo entradas, salida y luz por canal (a / b), en dos columnas

include <../comun/constantes.scad>
include <../comun/panel.scad>
include <../comun/componentes.scad>
include <../comun/tornillos.scad>
include <../comun/texto.scad>
include <../comun/columnas.scad>
include <../comun/espaciado.scad>
include <../comun/versiones.scad>

module compa_panel() {
  ancho = MODULO_ANCHO * COMPA_HP;
  alto  = MODULO_ALTURA_3U;

  COLUMNA_IZQ = COLUMNAS_DOS_1;
  COLUMNA_DER = COLUMNAS_DOS_2;

  ENTRADA_A_1_Y = 0.40;
  ENTRADA_A_2_Y = ENTRADA_A_1_Y + ESPACIADO_DELTA_Y_ENTRADA_ENTRADA;

  ENTRADA_B_1_Y = 0.60;
  ENTRADA_B_2_Y = ENTRADA_B_1_Y + ESPACIADO_DELTA_Y_ENTRADA_ENTRADA;

  SALIDA_Y = 0.90;
  LUZ_Y = SALIDA_Y - ESPACIADO_DELTA_Y_SALIDA_LUZ;

  difference() {
    panel_base(ancho, alto);

    union() {
      agujeros_tornillos(ancho, alto, ambos_lados = false);

      agujero_jack(ancho, alto, COLUMNA_IZQ, ENTRADA_A_1_Y);
      agujero_jack(ancho, alto, COLUMNA_IZQ, ENTRADA_A_2_Y);

      agujero_jack(ancho, alto, COLUMNA_DER, ENTRADA_B_1_Y);
      agujero_jack(ancho, alto, COLUMNA_DER, ENTRADA_B_2_Y);

      agujero_jack(ancho, alto, COLUMNA_IZQ, SALIDA_Y);
      agujero_led(ancho, alto, COLUMNA_IZQ, LUZ_Y);

      agujero_jack(ancho, alto, COLUMNA_DER, SALIDA_Y);
      agujero_led(ancho, alto, COLUMNA_DER, LUZ_Y);

      grabados_panel(COMPA_TEXTO, COMPA_VERSION, ancho, alto);
    }
  }
}
