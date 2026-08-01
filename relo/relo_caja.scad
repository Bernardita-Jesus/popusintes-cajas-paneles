// relo_caja.scad

include <../comun/constantes.scad>
include <../comun/texto.scad>
include <../comun/versiones.scad>


module relo_caja() {

  ancho       = CAJA_ANCHO * RELO_HP;
  altura      = CAJA_ALTURA;
  profundidad = CAJA_PROFUNDIDAD;
  
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
    difference() {
      caja_redondeada(
        ancho*0.99,
        altura*0.99,
        pared,
        radio_esquina);



      // grabados en la base
      texto_base(RELO_TEXTO, MODULO_ALTURA_3U * 0.05, ancho/2, 40*altura/100);
      texto_base(RELO_VERSION, MODULO_ALTURA_3U * 0.05, ancho/2, 60*altura/100);
    
    }
  }

  cuerpo();
  base();

}