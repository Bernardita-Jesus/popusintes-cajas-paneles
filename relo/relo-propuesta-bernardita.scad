// popusintes-carcasas

// constantes tornillos M3
// medidas en mm
// M3_DIAMETRO_PASO = 2.6;
// M3_DIAMETRO_HOLGURA = 3.4;

// constantes roscas M3
// medidas en mm
// rosca usada como traduccion de boss
// ROSCA_DIAMETRO = 7;
// ROSCA_ALTURA = 6;
// ROSCA_MARGEN = 5;
// ROSCA_DIAMETRO_PILOTO = 2.6;

// medidas del panel
ANCHO = 25.4;
ALTO = 128.4;
ESPESOR = 3;

// columnas
COLUMNA_IZQ = ANCHO * 0.30;
COLUMNA_DER = ANCHO * 0.70;

// altura de agujeros
AGUJERO_ALTURA = 30;

$fn = 100;



// Posiciones relativas
BORDE = ANCHO * 0.20;      // 20% desde el borde
CENTRO = 0;


module perillaChicaPrueba(x, y) {

translate([x, y, -AGUJERO_ALTURA/2])
color("plum")
cylinder(
h = AGUJERO_ALTURA,
r = 3,
center = false
);

}

// perillaMediana
module perillaMedianaPrueba(x, y) {

translate([x, y, -AGUJERO_ALTURA/2])
color("plum")
cylinder(
h = AGUJERO_ALTURA,
r = 4,5,
center = false
);

}

// perillaGrande
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
perillaChicaPrueba(COLUMNA_IZQ, ALTO*0.46);

//////////////////
// columna derecha
//////////////////

// perilla desfase b
perillaChicaPrueba(COLUMNA_DER, ALTO*0.70);

// perilla desface atenuversor
perillaChicaPrueba(COLUMNA_DER, ALTO*0.80);

// jack desfase b
perillaChicaPrueba(COLUMNA_DER, ALTO*0.90);

//////////////////
// salidas
//////////////////

// luz a

// jack a

// luz b

// jack b

// perillaChicaPrueba(COLUMNA_IZQ, ALTO*0.60);

// perillaGrandePrueba(COLUMNA_IZQ, ALTO*0.82);

// ladoDerecho
// perillaChicaPrueba(COLUMNA_DER, ALTO*0.100);

// ladoDerecho
// perillaChicaPrueba(COLUMNA_DER, ALTO*0.99);
}

}
