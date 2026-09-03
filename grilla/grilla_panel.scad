// grilla_panel.scad
// panel de referencia: en cada columna del layout, una fila de perillas
// y, en las posiciones donde los demas paneles ponen jacks, agujeros de
// jack ts: uno de entrada justo debajo de cada perilla (delta de
// espaciado.scad, como en recta / envo / relo) y uno de salida al pie
// de la columna. lleva ademas los 4 tornillos de montaje.
//
// se genera en dos tamanhos (ver grilla.scad): 4 hp usa 2 columnas
// (COLUMNAS_DOS) y 8 hp usa las 4 columnas del layout ancho
// (COLUMNAS_CUATRO)

include <../comun/constantes.scad>
include <../comun/panel.scad>
include <../comun/componentes.scad>
include <../comun/tornillos.scad>
include <../comun/texto.scad>
include <../comun/columnas.scad>
include <../comun/espaciado.scad>
include <../comun/versiones.scad>

// perilla y jack ts usan agujero_perilla_grande() y agujero_jack(), que
// ya toman los diametros reales (RADIO_AGUJERO_PERILLA,
// RADIO_AGUJERO_JACK) compartidos con todos los paneles

module grilla_panel(hp = GRILLA_HP_ANCHA) {
  ancho = MODULO_ANCHO * hp;
  alto  = MODULO_ALTURA_3U;

  // 4 columnas si hay ancho para el layout de rerelo, 2 si no
  columnas = hp >= 6
    ? [COLUMNAS_CUATRO_1, COLUMNAS_CUATRO_2, COLUMNAS_CUATRO_3, COLUMNAS_CUATRO_4]
    : [COLUMNAS_DOS_1, COLUMNAS_DOS_2];

  // perillas repartidas parejo en la franja util; la ultima deja lugar
  // para su jack de entrada y para el jack de salida al pie
  GRILLA_PERILLAS = 4;
  GRILLA_Y_INICIO = 0.15;
  GRILLA_Y_FIN = 0.72;
  SALIDA_Y = 0.90;

  difference() {
    panel_base(ancho, alto);

    union() {
      agujeros_tornillos(ancho, alto);

      for (px = columnas) {
        for (i = [0 : GRILLA_PERILLAS - 1]) {
          py = GRILLA_Y_INICIO
             + (GRILLA_Y_FIN - GRILLA_Y_INICIO) * i / (GRILLA_PERILLAS - 1);
          agujero_perilla_grande(ancho, alto, px, py);
          agujero_jack(ancho, alto, px, py + ESPACIADO_DELTA_Y_BOTON_ENTRADA);
        }
        agujero_jack(ancho, alto, px, SALIDA_Y);
      }

      grabados_panel(GRILLA_TEXTO, VERSION, ancho, alto);
    }
  }
}
