// perillas.scad

include <./constantes.scad>

// unica perilla de relleno para los paneles genericos (ver panel.scad)
module perilla(x, y, z) {
translate([x, y, -z/2])
      cylinder(
      h=z*2,
      r=RADIO_PERILLA,
      center=false);
}
