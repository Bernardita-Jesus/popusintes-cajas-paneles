// relo_panel.scad

include <../comun/constantes.scad>
include <../comun/versiones.scad>
include <../comun/texto.scad>

module relo_panel() {

  // medidas del panel
  ANCHO = MODULO_ANCHO * RELO_HP;
  ALTO = MODULO_ALTURA_3U;
  ESPESOR = PANEL_ESPESOR;

  // columnas para los elementos
  COLUMNA_IZQ = ANCHO * 0.30;
  COLUMNA_DER = ANCHO * 0.70;

  // profundidad de agujeros
  AGUJERO_ALTURA = ALTURA_AGUJERO_CONECTOR;

  // cantidad de caras de los cilindros
  $fn = 100;

  ////////////////////
  // referencias de los pernos
  ////////////////////

  // Distancia de los pernos respecto a los bordes del panel
  // MARGEN_X y MARGEN_Y definidos en comun/constantes.scad

  // Posición horizontal de los pernos
  PERNO_IZQUIERDO = MARGEN_X;
  PERNO_DERECHO = ANCHO - MARGEN_X;

  // Posición vertical de los pernos
  PERNO_SUPERIOR = ALTO - MARGEN_Y;
  PERNO_INFERIOR = MARGEN_Y;

  //////////////////////
  // PERFORACIÓN PARA LOS PERNOS
  //////////////////////

  module agujero_perno() {
    cylinder(
      h = ESPESOR + 2,   // Atraviesa completamente el panel
      d = M3_DIAMETRO_,  // Diámetro del agujero para el tornillo de montaje
      $fn = 50
    );
  }

  // cilindro pequeño leds
  module cilindroMini(x, y) {

    translate([x, y, -AGUJERO_ALTURA/2])
    color("plum")
    cylinder(
      h = AGUJERO_ALTURA,
      r = RADIO_AGUJERO_LED,
      center = false
    );

  }

  // cilindro mediana para jacks ts
  module cilindroMediano(x, y) {

    translate([x, y, -AGUJERO_ALTURA/2])
    color("plum")
    cylinder(
      h = AGUJERO_ALTURA,
      r = RADIO_AGUJERO_JACK,
      center = false
    );

  }

  // cilindro pequeña para botones
  module cilindroPerilla(x, y) {

    translate([x, y, -AGUJERO_ALTURA/2])
    color("plum")
    cylinder(
      h = AGUJERO_ALTURA,
      r = RADIO_AGUJERO_BOTON,
      center = false
    );

  }

  // cilindro grande para perilla
  module cilindroGrande(x, y) {

    translate([x, y, -AGUJERO_ALTURA/2])
    color("plum")
    cylinder(
      h = AGUJERO_ALTURA,
      r = RADIO_AGUJERO_PERILLA,
      center = false
    );

  }

  difference() {

    // Panel centrado
    color("magenta")
    cube([ANCHO, ALTO, ESPESOR], center = false);

    union() {

      // todas las medidas de distancias son aprox

      ////////////////////
      // columna izquierda
      ////////////////////

      // perilla tempo
      cilindroGrande(COLUMNA_IZQ, ALTO*0.16);

      // boton resincronizar
      cilindroMediano(COLUMNA_IZQ, ALTO*0.35);

      // jack resincronizar
      cilindroMediano(COLUMNA_IZQ, ALTO*0.43);

      // luz a
      cilindroMini(COLUMNA_IZQ, ALTO*0.85);

      // jack a
      cilindroMediano(COLUMNA_IZQ, ALTO*0.90);

      //////////////////
      // columna derecha
      //////////////////

      // perilla desfase b
      cilindroPerilla(COLUMNA_DER, ALTO*0.58);

      // perilla desface atenuversor
      cilindroMediano(COLUMNA_DER, ALTO*0.67);

      // jack desfase b
      cilindroMediano(COLUMNA_DER, ALTO*0.75);

      // luz b
      cilindroMini(COLUMNA_DER, ALTO*0.85);

      // jack b
      cilindroMediano(COLUMNA_DER, ALTO*0.90);

      ////////////////////
      // diferencias para los pernos
      // no referenciados a las columnas
      ////////////////////

      // Perno superior izquierdo
      translate([PERNO_IZQUIERDO, PERNO_SUPERIOR, -1]) agujero_perno();

      // Perno inferior izquierdo
      translate([PERNO_IZQUIERDO, PERNO_INFERIOR, -1]) agujero_perno();

      // Perno superior derecho
      translate([PERNO_DERECHO, PERNO_SUPERIOR, -1]) agujero_perno();

      // Perno inferior derecho
      translate([PERNO_DERECHO, PERNO_INFERIOR, -1]) agujero_perno();

      ////////////////////
      // grabados en la cara trasera
      // franja libre de agujeros bajo el perno inferior
      // fuente failsafe: este panel se comparte con colegas
      // que no tienen grabado_fuente instalada
      ////////////////////

      texto_base(RELO_TEXTO, ALTO * 0.018, ANCHO/2, ALTO * 0.055, grabado_fuente_failsafe);
      texto_base(RELO_VERSION, ALTO * 0.0155, ANCHO/2, ALTO * 0.093, grabado_fuente_failsafe);

    }

  }

}
