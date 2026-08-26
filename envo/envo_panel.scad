// envo_panel.scad
// agujeros copiados del layout de rack/src/Envo.cpp: perillas de subida
// y bajada, entradas de pulso y forzar, por canal (a / b), en dos
// columnas

include <../comun/constantes.scad>
include <../comun/panel.scad>
include <../comun/componentes.scad>
include <../comun/tornillos.scad>
include <../comun/texto.scad>
include <../comun/columnas.scad>
include <../comun/espaciado.scad>
include <../comun/versiones.scad>

module envo_panel() {
  ancho = MODULO_ANCHO * ENVO_HP;
  alto  = MODULO_ALTURA_3U;

  COLUMNA_IZQ = COLUMNAS_DOS_1;
  COLUMNA_DER = COLUMNAS_DOS_2;

  // canal a: columna izquierda, arranca mas arriba
  SUBIDA_A_Y = 0.35;
  BAJADA_A_Y = SUBIDA_A_Y + ESPACIADO_DELTA_Y_PERILLA_ATENUVERSOR;
  ENTRADA_PULSO_A_Y = BAJADA_A_Y + ESPACIADO_DELTA_Y_BOTON_ENTRADA;
  ENTRADA_FORZAR_A_Y = ENTRADA_PULSO_A_Y + ESPACIADO_DELTA_Y_ENTRADA_ENTRADA;

  // canal b: columna derecha, arranca mas abajo, para el efecto escalera
  SUBIDA_B_Y = 0.55;
  BAJADA_B_Y = SUBIDA_B_Y + ESPACIADO_DELTA_Y_PERILLA_ATENUVERSOR;
  ENTRADA_PULSO_B_Y = BAJADA_B_Y + ESPACIADO_DELTA_Y_BOTON_ENTRADA;
  ENTRADA_FORZAR_B_Y = ENTRADA_PULSO_B_Y + ESPACIADO_DELTA_Y_ENTRADA_ENTRADA;

  SALIDA_Y = 0.90;
  LUZ_Y = SALIDA_Y - ESPACIADO_DELTA_Y_SALIDA_LUZ;

  difference() {
    panel_base(ancho, alto);

    union() {
      agujeros_tornillos(ancho, alto, ambos_lados = false);

      agujero_perilla_grande(ancho, alto, COLUMNA_IZQ, SUBIDA_A_Y);
      agujero_perilla_grande(ancho, alto, COLUMNA_IZQ, BAJADA_A_Y);
      agujero_jack(ancho, alto, COLUMNA_IZQ, ENTRADA_PULSO_A_Y);
      agujero_jack(ancho, alto, COLUMNA_IZQ, ENTRADA_FORZAR_A_Y);

      agujero_perilla_grande(ancho, alto, COLUMNA_DER, SUBIDA_B_Y);
      agujero_perilla_grande(ancho, alto, COLUMNA_DER, BAJADA_B_Y);
      agujero_jack(ancho, alto, COLUMNA_DER, ENTRADA_PULSO_B_Y);
      agujero_jack(ancho, alto, COLUMNA_DER, ENTRADA_FORZAR_B_Y);

      agujero_jack(ancho, alto, COLUMNA_IZQ, SALIDA_Y);
      agujero_led(ancho, alto, COLUMNA_IZQ, LUZ_Y);

      agujero_jack(ancho, alto, COLUMNA_DER, SALIDA_Y);
      agujero_led(ancho, alto, COLUMNA_DER, LUZ_Y);

      grabados_panel(ENVO_TEXTO, VERSION, ancho, alto);
    }
  }
}
