// rerelo_panel.scad

include <../comun/constantes.scad>
include <../comun/versiones.scad>
include <../comun/texto.scad>

module rerelo_panel() {

  // medidas del panel
  ANCHO = MODULO_ANCHO * RERELO_HP;
  ALTO = MODULO_ALTURA_3U;
  ESPESOR = PANEL_ESPESOR;

  // columnas para los elementos
  // dos copias del relo (2 columnas cada una), una por mitad del panel
  COLUMNA_1 = ANCHO * 0.15;
  COLUMNA_2 = ANCHO * 0.35;
  COLUMNA_3 = ANCHO * 0.65;
  COLUMNA_4 = ANCHO * 0.85;

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
      // columna 1 (izquierda del primer relo)
      ////////////////////

      // perilla tempo
      cilindroGrande(COLUMNA_1, ALTO*0.16);

      // boton resincronizar
      cilindroMediano(COLUMNA_1, ALTO*0.35);

      // jack resincronizar
      cilindroMediano(COLUMNA_1, ALTO*0.43);

      // luz a
      cilindroMini(COLUMNA_1, ALTO*0.85);

      // jack a
      cilindroMediano(COLUMNA_1, ALTO*0.90);

      ////////////////////
      // columna 2 (derecha del primer relo)
      ////////////////////

      // perilla desfase b
      cilindroPerilla(COLUMNA_2, ALTO*0.58);

      // perilla desface atenuversor
      cilindroMediano(COLUMNA_2, ALTO*0.67);

      // jack desfase b
      cilindroMediano(COLUMNA_2, ALTO*0.75);

      // luz b
      cilindroMini(COLUMNA_2, ALTO*0.85);

      // jack b
      cilindroMediano(COLUMNA_2, ALTO*0.90);

      ////////////////////
      // columna 3 (izquierda del segundo relo)
      ////////////////////

      // perilla tempo
      cilindroGrande(COLUMNA_3, ALTO*0.16);

      // boton resincronizar
      cilindroMediano(COLUMNA_3, ALTO*0.35);

      // jack resincronizar
      cilindroMediano(COLUMNA_3, ALTO*0.43);

      // luz a
      cilindroMini(COLUMNA_3, ALTO*0.85);

      // jack a
      cilindroMediano(COLUMNA_3, ALTO*0.90);

      ////////////////////
      // columna 4 (derecha del segundo relo)
      ////////////////////

      // perilla desfase b
      cilindroPerilla(COLUMNA_4, ALTO*0.58);

      // perilla desface atenuversor
      cilindroMediano(COLUMNA_4, ALTO*0.67);

      // jack desfase b
      cilindroMediano(COLUMNA_4, ALTO*0.75);

      // luz b
      cilindroMini(COLUMNA_4, ALTO*0.85);

      // jack b
      cilindroMediano(COLUMNA_4, ALTO*0.90);

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
      ////////////////////

      texto_base(RERELO_TEXTO, ALTO * 0.018, ANCHO/2, ALTO * 0.055);
      texto_base(RERELO_VERSION, ALTO * 0.0155, ANCHO/2, ALTO * 0.093);

    }

  }

}
