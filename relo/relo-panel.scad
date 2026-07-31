// constantes numericas
include <../comun/constantes.scad>

// elementos de panel
include <../comun/perillas.scad>


module reloPanel() {
    ancho       = MODULO_ANCHO * 5.0;
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