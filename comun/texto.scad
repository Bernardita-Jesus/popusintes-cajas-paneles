// texto.scad

include <./constantes.scad>

// fuente del texto
// incluida con openscad, sin instalacion
// para que el grabado se vea igual en cualquier maquina
grabado_fuente   = "Liberation Sans:style=Bold";
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

// grabados estandar de un panel con layout propio: nombre del modulo y
// version, centrados en x, en la franja libre de controles justo bajo
// los tornillos superiores (ver tornillos.scad). esta franja es la
// misma para todos los modulos porque MODULO_ALTURA_3U es constante
module grabados_panel(texto, version, ancho, altura) {
  if (texto != "")
    texto_base(texto, altura * 0.024, ancho/2, altura - 7.4);
  if (version != "")
    texto_base(version, altura * 0.02, ancho/2, altura - 11.4);
}
