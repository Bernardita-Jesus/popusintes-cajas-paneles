// relo_panel.scad

include <../comun/constantes.scad>
include <../comun/versiones.scad>

module relo_panel() {

  // medidas del panel
  ANCHO = MODULO_ANCHO * RELO_HP;
  ALTO = MODULO_ALTURA_3U;
  ESPESOR = 2;

  // columnas para los elementos
  COLUMNA_IZQ = ANCHO * 0.30;
  COLUMNA_DER = ANCHO * 0.70;

  // profundidad de agujeros
  AGUJERO_ALTURA = 30;

  // cantidad de caras de los cilindros
  $fn = 100;

  ////////////////////
  // referencias de los pernos
  ////////////////////

  // Distancia de los pernos respecto a los bordes del panel
  MARGEN_X = 7.5;
  MARGEN_Y = 3;

  // Posición horizontal de los pernos
  PERNO_IZQUIERDO = MARGEN_X;
  PERNO_DERECHO = ANCHO - MARGEN_X;

  // Posición vertical de los pernos
  PERNO_SUPERIOR = ALTO - MARGEN_Y;
  PERNO_INFERIOR = MARGEN_Y;

  //////////////////////
  // PERFORACIÓN PARA LOS PERNOS
  //////////////////////

  // Diámetro del agujero para el tornillo de montaje
  DIAMETRO_PERNO = 3.4;

  module agujero_perno() {
    cylinder(
      h = ESPESOR + 2,   // Atraviesa completamente el panel
      d = DIAMETRO_PERNO,
      $fn = 50
    );
  }

  // cilindro pequeño leds
  module cilindroMini(x, y) {

    translate([x, y, -AGUJERO_ALTURA/2])
    color("plum")
    cylinder(
      h = AGUJERO_ALTURA,
      r = 1.7,
      center = false
    );

  }

  // cilindro mediana para jacks ts
  module cilindroMediano(x, y) {

    translate([x, y, -AGUJERO_ALTURA/2])
    color("plum")
    cylinder(
      h = AGUJERO_ALTURA,
      r = 3.25,
      center = false
    );

  }

  // cilindro pequeña para botones
  module cilindroPerilla(x, y) {

    translate([x, y, -AGUJERO_ALTURA/2])
    color("plum")
    cylinder(
      h = AGUJERO_ALTURA,
      r = 4.4,
      center = false
    );

  }

  // cilindro grande para perilla
  module cilindroGrande(x, y) {

    translate([x, y, -AGUJERO_ALTURA/2])
    color("plum")
    cylinder(
      h = AGUJERO_ALTURA,
      r = 5.6,
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

    }

  }

}
