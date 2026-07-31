// popusintes-carcasas

// constantes mecanicas eurorack
// medidas en mm
// MODULO_ANCHO = 5.08;
// MODULO_ALTURA_3U  = 128.4; 
// MODULO_PROFUNDIDAD = 40.0;

// margenes de los tornillos segun ejemplo vcv
// medidos en mm
// RIEL_MARGEN_X = 7.62;
// RIEL_MARGEN_Y = 2.54; 

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

// Panel centrado
color("magenta")
cube([ANCHO, ALTO, ESPESOR], center = false);

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

// Perilla grande
// x: columna izquierda
// y: 20 porciento de altura
translate([
//-ANCHO/2 + BORDE,
COLUMNA_IZQ,
ALTO*0.80,
-AGUJERO_ALTURA/2
])
color("plum")
cylinder(
h = AGUJERO_ALTURA,
r = 6, center = false
);

// Perilla mediana
translate([10, ALTO/2 - ALTO*0.30, -AGUJERO_ALTURA/2
])
color("plum")
cylinder(
h = AGUJERO_ALTURA, 
r = 6, 
center = false
);

perillaChicaPrueba(COLUMNA_IZQ, ALTO*0.40);

perillaChicaPrueba(COLUMNA_IZQ, ALTO*0.70);

perillaChicaPrueba(COLUMNA_IZQ, ALTO*0.90);

