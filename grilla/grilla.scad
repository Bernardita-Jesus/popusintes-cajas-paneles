// grilla.scad
// los dos tamanhos del panel de referencia, lado a lado: 4 hp y 8 hp

$fn = 32;

include <./grilla_caja.scad>
include <./grilla_panel.scad>

grilla_panel(GRILLA_HP_CHICA);

translate([MODULO_ANCHO * GRILLA_HP_CHICA + 10, 0, 0])
  grilla_panel(GRILLA_HP_ANCHA);
