// relo_panel.scad

// constantes numericas
include <../comun/constantes.scad>
include <../comun/perillas.scad>
include <../comun/texto.scad>
include <../comun/versiones.scad>


module relo_panel() {
    ancho       = MODULO_ANCHO * RELO_VERSION;
    altura      = MODULO_ALTURA_3U;
    profundidad = PANEL_PROFUNDIDAD;

    // suavidad de círculos/cilindros
    $fn = 32; 
    
    difference() {

    // esquinas redondeadas via minkowski en 2D
    // extruido a la profundidad
    linear_extrude(height = profundidad) {
        translate([RADIO_BORDE_PANEL, RADIO_BORDE_PANEL]) {
            minkowski() {
                square(
                [
                ancho - 2*RADIO_BORDE_PANEL,
                altura - 2*RADIO_BORDE_PANEL
                ]
                );
                circle(r = RADIO_BORDE_PANEL);
            }
        }
    }

     // union de los agujeros para perillas
    union() {
    perillaChica(ancho/2, 25*altura/100, profundidad);
    perillaChica(ancho/2, 50*altura/100, profundidad);
    perillaChica(ancho/2, 75*altura/100, profundidad);
    }
    }

    
}