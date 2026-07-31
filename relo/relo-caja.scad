// relo
// caja

include <../comun/constantes.scad>

module relo_caja() {

  ancho       = MODULO_ANCHO * 5.0;
  altura      = MODULO_ALTURA_3U;
  profundidad = MODULO_PROFUNDIDAD;
  
  pared = 2.0;
  
  // redondeo de esquinas exteriores verticales
  radio_esquina = 1.5; 
  
  // altura del chaflan guía en agujeros piloto
  chaflan_alto  = 0.6; 
  // diámetro ancho del chaflan
  chaflan_diam  = ROSCA_DIAMETRO_PILOTO + 1.4;
  
  // caja con esquinas verticales redondeadas
  module caja_redondeada(a, al, p, r) {
      minkowski() {
          cube([a - 2*r, al - 2*r, p], center=false);
          translate([r, r, 0])
              cylinder(r=r, h=0.01);
      }
  }
  
  module cuerpo() {
    difference() {
      union() {
      // caja hueca
      // con esquinas exteriores redondeadas
        difference() {
          caja_redondeada(ancho, altura, profundidad, radio_esquina);
          
          translate([pared, pared, -1])
            cube([
                ancho - 2 * pared,
                altura - 2 * pared,
                profundidad + 2
            ], center=false);
        }
      }
    }
  }
  
  module base() {
  caja_redondeada(
    ancho*0.99,
    altura*0.99,
    pared,
    radio_esquina);
  }

  cuerpo();
  base();

}