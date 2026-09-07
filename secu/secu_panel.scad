// secu_panel.scad
// agujeros copiados del layout de rack/src/Secu.cpp: entrada de reloj
// y 4 perillas de paso por canal (a / b), en dos columnas

include <../comun/constantes.scad>
include <../comun/panel.scad>
include <../comun/componentes.scad>
include <../comun/tornillos.scad>
include <../comun/texto.scad>
include <../comun/columnas.scad>
include <../comun/espaciado.scad>
include <../comun/versiones.scad>

module secu_panel() {
  ancho = MODULO_ANCHO * SECU_HP;
  alto  = MODULO_ALTURA_3U;

  COLUMNA_IZQ = COLUMNAS_DOS_1;
  COLUMNA_DER = COLUMNAS_DOS_2;

  // canal a: columna izquierda, arranca mas arriba
  ENTRADA_TRIGGER_A_Y = 0.30;
  PASO_A_0_Y = 0.40;
  PASO_A_1_Y = PASO_A_0_Y + ESPACIADO_DELTA_Y_PERILLA_ATENUVERSOR;
  PASO_A_2_Y = PASO_A_1_Y + ESPACIADO_DELTA_Y_PERILLA_ATENUVERSOR;
  PASO_A_3_Y = PASO_A_2_Y + ESPACIADO_DELTA_Y_PERILLA_ATENUVERSOR;

  // canal b: columna derecha, arranca mas abajo, para el efecto escalera
  ENTRADA_TRIGGER_B_Y = 0.40;
  PASO_B_0_Y = 0.50;
  PASO_B_1_Y = PASO_B_0_Y + ESPACIADO_DELTA_Y_PERILLA_ATENUVERSOR;
  PASO_B_2_Y = PASO_B_1_Y + ESPACIADO_DELTA_Y_PERILLA_ATENUVERSOR;
  PASO_B_3_Y = PASO_B_2_Y + ESPACIADO_DELTA_Y_PERILLA_ATENUVERSOR;

  SALIDA_Y = 0.90;
  LUCES_Y = SALIDA_Y - ESPACIADO_DELTA_Y_SALIDA_LUZ;

  difference() {
    panel_base(ancho, alto);

    union() {
      agujeros_tornillos(ancho, alto);

      agujero_jack(ancho, alto, COLUMNA_IZQ, ENTRADA_TRIGGER_A_Y);
      agujero_perilla(ancho, alto, COLUMNA_IZQ, PASO_A_0_Y);
      agujero_perilla(ancho, alto, COLUMNA_IZQ, PASO_A_1_Y);
      agujero_perilla(ancho, alto, COLUMNA_IZQ, PASO_A_2_Y);
      agujero_perilla(ancho, alto, COLUMNA_IZQ, PASO_A_3_Y);

      agujero_jack(ancho, alto, COLUMNA_DER, ENTRADA_TRIGGER_B_Y);
      agujero_perilla(ancho, alto, COLUMNA_DER, PASO_B_0_Y);
      agujero_perilla(ancho, alto, COLUMNA_DER, PASO_B_1_Y);
      agujero_perilla(ancho, alto, COLUMNA_DER, PASO_B_2_Y);
      agujero_perilla(ancho, alto, COLUMNA_DER, PASO_B_3_Y);

      agujero_jack(ancho, alto, COLUMNA_IZQ, SALIDA_Y);
      agujero_led(ancho, alto, COLUMNA_IZQ, LUCES_Y);

      agujero_jack(ancho, alto, COLUMNA_DER, SALIDA_Y);
      agujero_led(ancho, alto, COLUMNA_DER, LUCES_Y);

      grabados_panel(SECU_TEXTO, VERSION, ancho, alto);
    }
  }
}
