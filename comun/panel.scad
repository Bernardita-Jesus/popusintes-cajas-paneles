// panel.scad

include <./constantes.scad>
include <./perillas.scad>
include <./texto.scad>

// forma base del panel: rectangulo con esquinas redondeadas, extruido
// a la profundidad. sin agujeros; los paneles con layout propio
// (ver <modulo>_panel.scad) parten de esta forma y le restan sus
// propios agujeros
module panel_base(ancho, altura = MODULO_ALTURA_3U, profundidad = PANEL_PROFUNDIDAD) {
    // suavidad de círculos/cilindros
    $fn = 32;

    // esquinas redondeadas via minkowski en 2D
    // extruido a la profundidad
    linear_extrude(height = profundidad) {
        translate([RADIO_BORDE_PANEL, RADIO_BORDE_PANEL]) {
            minkowski() {
                square([
                    ancho - 2*RADIO_BORDE_PANEL,
                    altura - 2*RADIO_BORDE_PANEL
                ]);
                circle(r = RADIO_BORDE_PANEL);
            }
        }
    }
}

// panel generico: forma base con perillas de relleno distribuidas en
// partes iguales, para modulos sin layout de componentes propio
module panel(
    ancho,
    altura = MODULO_ALTURA_3U,
    profundidad = PANEL_PROFUNDIDAD,
    num_perillas = 3,
    texto = "",
    version = ""
) {
    // suavidad de círculos/cilindros
    $fn = 32;

    difference() {

        panel_base(ancho, altura, profundidad);

        // union de los agujeros para perillas
        // distribuidas en partes iguales a lo alto del panel
        union() {
            for (i = [1 : num_perillas])
                perilla(ancho/2, i*100/(num_perillas+1) * altura/100, profundidad);

            // grabados en la parte baja de la cara trasera
            if (texto != "")
                texto_base(texto, altura * 0.025, ancho/2, altura * 0.06);
            if (version != "")
                texto_base(version, altura * 0.018, ancho/2, altura * 0.12);
        }
    }
}
