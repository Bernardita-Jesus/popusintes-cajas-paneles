// popusintes-carcasas

// medidas del panel
ANCHO = 25.4;
ALTO = 128.4;
ESPESOR = 2;

// columnas para los elementos
COLUMNA_IZQ = ANCHO * 0.30;
COLUMNA_DER = ANCHO * 0.70;

// profundidad de agujeros
AGUJERO_ALTURA = 30;

// cantidad de caras de los cilindros
$fn = 100;


// Posiciones relativas
BORDE = ANCHO * 0.20;      // 20% desde el borde
CENTRO = 0;

////////////////////
// REFERENCIAS DE LOS PERNOS
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

// cilindro pequeña para botones
module perillaChicaPrueba(x, y) {

translate([x, y, -AGUJERO_ALTURA/2])
color("plum")
cylinder(
h = AGUJERO_ALTURA,
r = 2,
center = false
);

}

// cilindro mediana para jacks ts
module perillaMedianaPrueba(x, y) {

translate([x, y, -AGUJERO_ALTURA/2])
color("plum")
cylinder(
h = AGUJERO_ALTURA,
r = 3.25,
center = false
);

}

// cilindro grande para perilla
module perillaGrandePrueba(x, y) {

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
// todas las medidas son aprox

////////////////////
// columna izquierda
////////////////////

// perilla tempo
perillaGrandePrueba(COLUMNA_IZQ, ALTO*0.16);

// boton resincronizar
perillaChicaPrueba(COLUMNA_IZQ, ALTO*0.36);

// jack resincronizar
perillaMedianaPrueba(COLUMNA_IZQ, ALTO*0.46);

// luz a

// jack a
perillaMedianaPrueba(COLUMNA_IZQ, ALTO*0.89);


//////////////////
// columna derecha
//////////////////

// perilla desfase b
perillaChicaPrueba(COLUMNA_DER, ALTO*0.55);

// perilla desface atenuversor
perillaChicaPrueba(COLUMNA_DER, ALTO*0.65);

// jack desfase b
perillaMedianaPrueba(COLUMNA_DER, ALTO*0.75);

// luz b

// jack b
perillaMedianaPrueba(COLUMNA_DER, ALTO*0.89);

////////////////////
// diferencias para los pernos
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
