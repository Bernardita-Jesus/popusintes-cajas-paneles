// bote_caja.scad

include <../comun/constantes.scad>
include <../comun/texto.scad>
include <../comun/versiones.scad>

module bote_caja(hp = 1) {

  ancho_int       = CAJA_ANCHO * hp;
  altura_int      = CAJA_ALTURA;
  profundidad_int = CAJA_PROFUNDIDAD;

  ancho_ext       = 2 * CAJA_PARED + ancho_int;
  altura_ext      = 2 * CAJA_PARED + altura_int;
  profundidad_ext = 1 * CAJA_PARED + profundidad_int;
  
  pared = CAJA_PARED;
  
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
          caja_redondeada(
          ancho_ext,
          altura_ext,
          profundidad_ext,
          radio_esquina);
          
          translate([pared, pared, -1])
            cube([
                ancho_int,
                altura_int,
                2*profundidad_ext
            ], center=false);
        }
      }
    }
  }
  

  module base() {
    difference() {
      caja_redondeada(
        ancho_ext,
        altura_ext,
        pared,
        radio_esquina);

      // grabados en la base
      texto_base(
      BOTE_TEXTO,
      MODULO_ALTURA_3U * 0.08,
      ancho_ext/2,
      40*altura_ext/100);
      texto_base(
      BOTE_VERSION,
      MODULO_ALTURA_3U * 0.05,
      ancho_ext/2,
      60 * altura_ext/100);
    }
  }

  cuerpo();
  base();

}