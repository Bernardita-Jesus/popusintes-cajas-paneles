// caja.scad
// caja generica reutilizada por bote, recta y relo
//
// hp define el ancho util interior; el ancho exterior
// es una consecuencia de sumarle la pared

include <./constantes.scad>
include <./formas.scad>
include <./texto.scad>

module caja(
    hp,
    texto,
    version,
    pared = CAJA_PARED,
    radio_esquina = 1.5,
    tamano_texto = MODULO_ALTURA_3U * 0.05,
    tamano_version = MODULO_ALTURA_3U * 0.035
) {

  ancho_int       = CAJA_ANCHO * hp;
  altura_int      = CAJA_ALTURA;
  profundidad_int = CAJA_PROFUNDIDAD;

  ancho_ext       = 2 * pared + ancho_int;
  altura_ext      = 2 * pared + altura_int;
  profundidad_ext = pared + profundidad_int;

  module cuerpo() {
    difference() {
      // caja hueca con esquinas exteriores redondeadas
      caja_redondeada(ancho_ext, altura_ext, profundidad_ext, radio_esquina);

      translate([pared, pared, -1])
        cube([ancho_int, altura_int, 2 * profundidad_ext], center=false);
    }
  }

  module base() {
    difference() {
      caja_redondeada(ancho_ext, altura_ext, pared, radio_esquina);

      // grabados en la base
      texto_base(texto,   tamano_texto,   ancho_ext/2, 40*altura_ext/100);
      texto_base(version, tamano_version, ancho_ext/2, 60*altura_ext/100);
    }
  }

  cuerpo();
  base();
}
