// tornillos.scad
// agujeros de los 4 tornillos de montaje de un panel, en las esquinas.
// espejo de rack/src/comun/Tornillos.hpp (agregarTornillos), usando los
// margenes ya establecidos en constantes.scad (MARGEN_X, MARGEN_Y)

include <./constantes.scad>

module agujeros_tornillos(ancho, alto, espesor = PANEL_ESPESOR, ambos_lados = true) {
  izquierdo = MARGEN_X;
  derecho   = ancho - MARGEN_X;
  superior  = alto - MARGEN_Y;
  inferior  = MARGEN_Y;

  // paneles angostos (4 hp) solo alcanzan para una columna de
  // tornillos: con dos columnas los agujeros quedarian casi pegados
  posiciones = ambos_lados ? [
    [izquierdo, superior],
    [izquierdo, inferior],
    [derecho,   superior],
    [derecho,   inferior],
  ] : [
    [izquierdo, superior],
    [izquierdo, inferior],
  ];

  for (p = posiciones)
    translate([p[0], p[1], -1])
      cylinder(h = espesor + 2, d = M3_DIAMETRO_, $fn = 50);
}
