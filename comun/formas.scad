// formas.scad

// caja con esquinas verticales redondeadas
module caja_redondeada(ancho, altura, profundidad, radio) {
    minkowski() {
        cube([ancho - 2*radio, altura - 2*radio, profundidad], center=false);
        translate([radio, radio, 0])
            cylinder(r=radio, h=0.01);
    }
}
