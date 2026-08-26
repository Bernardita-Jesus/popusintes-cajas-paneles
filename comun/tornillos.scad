// tornillos.scad
// agujeros de los 4 tornillos de montaje de un panel, en las esquinas.
// espejo de rack/src/comun/Tornillos.hpp (agregarTornillos), usando los
// margenes ya establecidos en constantes.scad (MARGEN_X, MARGEN_Y)

include <./constantes.scad>

module agujeros_tornillos(ancho, alto, espesor = PANEL_ESPESOR) {
  izquierdo = MARGEN_X;
  derecho   = ancho - MARGEN_X;
  superior  = alto - MARGEN_Y;
  inferior  = MARGEN_Y;

  for (p = [
    [izquierdo, superior],
    [izquierdo, inferior],
    [derecho,   superior],
    [derecho,   inferior],
  ])
    translate([p[0], p[1], -1])
      cylinder(h = espesor + 2, d = M3_DIAMETRO_, $fn = 50);
}
