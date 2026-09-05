// componentes.scad
// agujeros para los componentes montados en un panel: perillas, jacks,
// botones, trimpots y luces. espejo, en openscad, de los componentes
// de vcv rack usados en rack/src/*.cpp (RoundBlackKnob,
// RoundSmallBlackKnob, Trimpot, TL1105, PJ301MPort, MediumLight)
//
// cada modulo recibe el ancho y alto del panel y un porcentaje de
// layout (px, py), igual que Posicionador::posicion en rack: asi los
// mismos porcentajes definidos en cada *.cpp se pueden reusar aca

include <./constantes.scad>
include <./posicionador.scad>

// perfora desde el frente hasta atras del panel, dejando espacio al
// cuerpo del componente montado en el pcb detras
module agujero_componente(radio, x, y) {
  translate([x, y, -ALTURA_AGUJERO_CONECTOR/2])
    color("plum")
    cylinder(h = ALTURA_AGUJERO_CONECTOR, r = radio, center = false, $fn = 50);
}

// PJ301MPort
module agujero_jack(ancho, alto, px, py) {
  p = posicion(ancho, alto, px, py);
  agujero_componente(RADIO_AGUJERO_JACK, p[0], p[1]);
}

// MediumLight
module agujero_led(ancho, alto, px, py) {
  p = posicion(ancho, alto, px, py);
  agujero_componente(RADIO_AGUJERO_LED, p[0], p[1]);
}

// TL1105
module agujero_boton(ancho, alto, px, py) {
  p = posicion(ancho, alto, px, py);
  agujero_componente(RADIO_AGUJERO_BOTON, p[0], p[1]);
}

// RoundBlackKnob / RoundSmallBlackKnob: una sola perilla, mismo tamanho
// para todos los paneles
module agujero_perilla(ancho, alto, px, py) {
  p = posicion(ancho, alto, px, py);
  agujero_componente(RADIO_AGUJERO_PERILLA, p[0], p[1]);
}

// Trimpot
module agujero_trimpot(ancho, alto, px, py) {
  p = posicion(ancho, alto, px, py);
  agujero_componente(RADIO_AGUJERO_TRIMPOT, p[0], p[1]);
}
