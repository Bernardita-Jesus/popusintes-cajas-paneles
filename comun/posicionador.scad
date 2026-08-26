// posicionador.scad
// convierte porcentajes de layout (0..1) en coordenadas [x, y] sobre el
// panel, en mm. espejo de rack/src/comun/Posicionador.hpp
//
// el eje y de rack aumenta hacia abajo, como en pantalla; el eje y de
// estos paneles aumenta hacia arriba, como el resto de openscad. por
// eso aca se invierte, para que los mismos porcentajes de layout
// definidos en cada modulo de rack queden en el mismo lugar fisico
// del panel

function posicion(ancho, alto, porcentaje_x, porcentaje_y) =
  [ancho * porcentaje_x, alto * (1 - porcentaje_y)];
