// perillas.scad

include <./constantes.scad>

module perillaChica(x, y, z) {
translate([x, y, -z/2])
      cylinder(
      h=z*2,
      r=RADIO_PERILLA_CHICA,
      center=false);
}