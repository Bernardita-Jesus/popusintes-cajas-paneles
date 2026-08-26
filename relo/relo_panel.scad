// relo_panel.scad
// agujeros copiados del layout de rack/src/Relo.cpp: perilla de tempo,
// boton + entrada de resincronizar en la columna izquierda; perilla de
// desfase, trimpot atenuversor y entrada cv en la columna derecha

include <../comun/constantes.scad>
include <../comun/panel.scad>
include <../comun/componentes.scad>
include <../comun/tornillos.scad>
include <../comun/texto.scad>
include <../comun/columnas.scad>
include <../comun/espaciado.scad>
include <../comun/versiones.scad>

module relo_panel() {
  ancho = MODULO_ANCHO * RELO_HP;
  alto  = MODULO_ALTURA_3U;

  COLUMNA_IZQ = COLUMNAS_DOS_1;
  COLUMNA_DER = COLUMNAS_DOS_2;

  PPM_Y = 0.15;

  BOTON_RESINC_Y = 0.35;
  ENTRADA_RESINC_Y = BOTON_RESINC_Y + ESPACIADO_DELTA_Y_BOTON_ENTRADA;

  DESFASE_B_Y = 0.60;
  DESFASE_CV_ATEN_Y = DESFASE_B_Y + ESPACIADO_DELTA_Y_PERILLA_ATENUVERSOR;
  ENTRADA_DESFASE_B_Y = DESFASE_B_Y + 2 * ESPACIADO_DELTA_Y_PERILLA_ATENUVERSOR;

  SALIDA_Y = 0.90;
  LUCES_Y = SALIDA_Y - ESPACIADO_DELTA_Y_SALIDA_LUZ;

  difference() {
    panel_base(ancho, alto);

    union() {
      agujeros_tornillos(ancho, alto, ambos_lados = false);

      agujero_perilla_grande(ancho, alto, COLUMNA_IZQ, PPM_Y);

      agujero_boton(ancho, alto, COLUMNA_IZQ, BOTON_RESINC_Y);
      agujero_jack(ancho, alto, COLUMNA_IZQ, ENTRADA_RESINC_Y);

      agujero_perilla_chica(ancho, alto, COLUMNA_DER, DESFASE_B_Y);
      agujero_trimpot(ancho, alto, COLUMNA_DER, DESFASE_CV_ATEN_Y);
      agujero_jack(ancho, alto, COLUMNA_DER, ENTRADA_DESFASE_B_Y);

      agujero_jack(ancho, alto, COLUMNA_IZQ, SALIDA_Y);
      agujero_led(ancho, alto, COLUMNA_IZQ, LUCES_Y);

      agujero_jack(ancho, alto, COLUMNA_DER, SALIDA_Y);
      agujero_led(ancho, alto, COLUMNA_DER, LUCES_Y);

      grabados_panel(RELO_TEXTO, VERSION, ancho, alto);
    }
  }
}
