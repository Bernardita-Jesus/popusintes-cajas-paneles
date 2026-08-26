// recta_panel.scad
// agujeros copiados del layout de rack/src/Recta.cpp: perilla de
// frecuencia + entrada v/oct, perilla de pwm + entrada cv, salida y
// luz, por canal (a / b), en dos columnas

include <../comun/constantes.scad>
include <../comun/panel.scad>
include <../comun/componentes.scad>
include <../comun/tornillos.scad>
include <../comun/texto.scad>
include <../comun/columnas.scad>
include <../comun/espaciado.scad>
include <../comun/versiones.scad>

module recta_panel() {
  ancho = MODULO_ANCHO * RECTA_HP;
  alto  = MODULO_ALTURA_3U;

  COLUMNA_IZQ = COLUMNAS_DOS_1;
  COLUMNA_DER = COLUMNAS_DOS_2;

  // canal a: columna izquierda, arranca mas arriba
  FRECUENCIA_A_Y = 0.25;
  ENTRADA_VOCT_A_Y = FRECUENCIA_A_Y + ESPACIADO_DELTA_Y_BOTON_ENTRADA;
  PWM_A_Y = 0.40;
  ENTRADA_PWM_A_Y = PWM_A_Y + ESPACIADO_DELTA_Y_BOTON_ENTRADA;

  // canal b: columna derecha, arranca mas abajo, para el efecto escalera
  FRECUENCIA_B_Y = 0.50;
  ENTRADA_VOCT_B_Y = FRECUENCIA_B_Y + ESPACIADO_DELTA_Y_BOTON_ENTRADA;
  PWM_B_Y = 0.65;
  ENTRADA_PWM_B_Y = PWM_B_Y + ESPACIADO_DELTA_Y_BOTON_ENTRADA;

  SALIDA_Y = 0.90;
  LUZ_Y = SALIDA_Y - ESPACIADO_DELTA_Y_SALIDA_LUZ;

  difference() {
    panel_base(ancho, alto);

    union() {
      agujeros_tornillos(ancho, alto, ambos_lados = false);

      agujero_perilla_chica(ancho, alto, COLUMNA_IZQ, FRECUENCIA_A_Y);
      agujero_jack(ancho, alto, COLUMNA_IZQ, ENTRADA_VOCT_A_Y);
      agujero_perilla_chica(ancho, alto, COLUMNA_IZQ, PWM_A_Y);
      agujero_jack(ancho, alto, COLUMNA_IZQ, ENTRADA_PWM_A_Y);

      agujero_perilla_chica(ancho, alto, COLUMNA_DER, FRECUENCIA_B_Y);
      agujero_jack(ancho, alto, COLUMNA_DER, ENTRADA_VOCT_B_Y);
      agujero_perilla_chica(ancho, alto, COLUMNA_DER, PWM_B_Y);
      agujero_jack(ancho, alto, COLUMNA_DER, ENTRADA_PWM_B_Y);

      agujero_jack(ancho, alto, COLUMNA_IZQ, SALIDA_Y);
      agujero_led(ancho, alto, COLUMNA_IZQ, LUZ_Y);

      agujero_jack(ancho, alto, COLUMNA_DER, SALIDA_Y);
      agujero_led(ancho, alto, COLUMNA_DER, LUZ_Y);

      grabados_panel(RECTA_TEXTO, RECTA_VERSION, ancho, alto);
    }
  }
}
