// texto.scad

include <./constantes.scad>

// fuente del texto
grabado_fuente   = "Talagante:style=Regular";
// fuente segura incluida con openscad, sin instalacion
// util para piezas que se comparten con colegas
// que no tienen grabado_fuente instalada
grabado_fuente_failsafe = "Liberation Sans:style=Bold";
// profundidad del grabado, menor que "pared"
grabado_hondo    = 0.6;

module texto_base(texto, tamano, x, y, fuente = grabado_fuente) {
  translate([x, y, -0.01])
  // espejo en y
  // text() se ve desde el lado -z
  // la cara exterior) de la base
  mirror([0, 1, 0])
  linear_extrude(height = grabado_hondo + 0.01)
  text(
    texto,
    size   = tamano,
    font   = fuente,
    halign = "center",
    valign = "center"
    );
}
