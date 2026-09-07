// rerelo_panel.scad
// agujeros copiados del layout de rack/src/Rerelo.cpp: tempo base y
// resincronizado en la columna a (canal de referencia, sin desfase);
// columnas b, c y d con perilla de desfase, trimpot atenuversor y
// entrada cv cada una

include <../comun/constantes.scad>
include <../comun/panel.scad>
include <../comun/componentes.scad>
include <../comun/tornillos.scad>
include <../comun/texto.scad>
include <../comun/columnas.scad>
include <../comun/espaciado.scad>
include <../comun/versiones.scad>

module rerelo_panel() {
  ancho = MODULO_ANCHO * RERELO_HP;
  alto  = MODULO_ALTURA_3U;

  COLUMNA_A = COLUMNAS_CUATRO_1;
  COLUMNA_B = COLUMNAS_CUATRO_2;
  COLUMNA_C = COLUMNAS_CUATRO_3;
  COLUMNA_D = COLUMNAS_CUATRO_4;

  // tempo base, compartido por los cuatro canales
  PPM_Y = 0.12;

  // a proposito no va centrado bajo el ppm: imita el layout de relo,
  // donde resinc vive debajo del tempo
  BOTON_RESINC_Y = 0.30;
  ENTRADA_RESINC_Y = BOTON_RESINC_Y + ESPACIADO_DELTA_Y_BOTON_ENTRADA;

  // canal b arranca mas arriba que c y d, en diagonal, para el efecto
  // escalera
  DESFASE_B_Y = 0.56;
  DESFASE_CV_ATEN_B_Y = DESFASE_B_Y + ESPACIADO_DELTA_Y_PERILLA_ATENUVERSOR;
  ENTRADA_DESFASE_B_Y = DESFASE_B_Y + 2 * ESPACIADO_DELTA_Y_PERILLA_ATENUVERSOR;

  DESFASE_C_Y = 0.42;
  DESFASE_CV_ATEN_C_Y = DESFASE_C_Y + ESPACIADO_DELTA_Y_PERILLA_ATENUVERSOR;
  ENTRADA_DESFASE_C_Y = DESFASE_C_Y + 2 * ESPACIADO_DELTA_Y_PERILLA_ATENUVERSOR;

  DESFASE_D_Y = 0.28;
  DESFASE_CV_ATEN_D_Y = DESFASE_D_Y + ESPACIADO_DELTA_Y_PERILLA_ATENUVERSOR;
  ENTRADA_DESFASE_D_Y = DESFASE_D_Y + 2 * ESPACIADO_DELTA_Y_PERILLA_ATENUVERSOR;

  SALIDA_Y = 0.90;
  LUCES_Y = SALIDA_Y - ESPACIADO_DELTA_Y_SALIDA_LUZ;

  difference() {
    panel_base(ancho, alto);

    union() {
      agujeros_tornillos(ancho, alto);

      agujero_perilla(ancho, alto, COLUMNA_A, PPM_Y);
      agujero_boton(ancho, alto, COLUMNA_A, BOTON_RESINC_Y);
      agujero_jack(ancho, alto, COLUMNA_A, ENTRADA_RESINC_Y);

      agujero_perilla(ancho, alto, COLUMNA_B, DESFASE_B_Y);
      agujero_trimpot(ancho, alto, COLUMNA_B, DESFASE_CV_ATEN_B_Y);
      agujero_jack(ancho, alto, COLUMNA_B, ENTRADA_DESFASE_B_Y);

      agujero_perilla(ancho, alto, COLUMNA_C, DESFASE_C_Y);
      agujero_trimpot(ancho, alto, COLUMNA_C, DESFASE_CV_ATEN_C_Y);
      agujero_jack(ancho, alto, COLUMNA_C, ENTRADA_DESFASE_C_Y);

      agujero_perilla(ancho, alto, COLUMNA_D, DESFASE_D_Y);
      agujero_trimpot(ancho, alto, COLUMNA_D, DESFASE_CV_ATEN_D_Y);
      agujero_jack(ancho, alto, COLUMNA_D, ENTRADA_DESFASE_D_Y);

      agujero_jack(ancho, alto, COLUMNA_A, SALIDA_Y);
      agujero_led(ancho, alto, COLUMNA_A, LUCES_Y);
      agujero_jack(ancho, alto, COLUMNA_B, SALIDA_Y);
      agujero_led(ancho, alto, COLUMNA_B, LUCES_Y);
      agujero_jack(ancho, alto, COLUMNA_C, SALIDA_Y);
      agujero_led(ancho, alto, COLUMNA_C, LUCES_Y);
      agujero_jack(ancho, alto, COLUMNA_D, SALIDA_Y);
      agujero_led(ancho, alto, COLUMNA_D, LUCES_Y);

      grabados_panel(RERELO_TEXTO, VERSION, ancho, alto);
    }
  }
}
