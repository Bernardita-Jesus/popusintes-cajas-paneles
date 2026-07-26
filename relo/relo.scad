include <../comun/constantes.scad>

module relo() {
    
    ancho       = MODULO_ANCHO * 5.0;
    altura      = MODULO_ALTURA_3U;
    profundidad = MODULO_PROFUNDIDAD;
    
    pared = 2;
    tapa  = 5;
    
    radio_esquina = 1.5; // redondeo de esquinas exteriores verticales
    chaflan_alto  = 0.6; // altura del chaflán guía en agujeros piloto
    chaflan_diam  = ROSCA_DIAMETRO_PILOTO + 1.4; // diámetro ancho del chaflán
    
    $fn = 32; // suavidad de círculos/cilindros
    
    // posiciones de los tornillos de riel (deben coincidir con el panel VCV)
    posiciones_riel = [
        [RIEL_MARGEN_X, RIEL_MARGEN_Y],
        [ancho - RIEL_MARGEN_X, RIEL_MARGEN_Y],
        [RIEL_MARGEN_X, altura - RIEL_MARGEN_Y],
        [ancho - RIEL_MARGEN_X, altura - RIEL_MARGEN_Y]
    ];
    
    // posiciones de los bosses internos (sujetan la tapa/fondo, no van al riel)
    posiciones_tornillos = [
        [ROSCA_MARGEN, ROSCA_MARGEN],
        [ancho - ROSCA_MARGEN, ROSCA_MARGEN],
        [ROSCA_MARGEN, altura - ROSCA_MARGEN],
        [ancho - ROSCA_MARGEN, altura - ROSCA_MARGEN]
    ];
    
    // caja con esquinas verticales redondeadas
    module caja_redondeada(a, al, p, r) {
        minkowski() {
            cube([a - 2*r, al - 2*r, p], center=false);
            translate([r, r, 0])
                cylinder(r=r, h=0.01);
        }
    }
    
    // agujero piloto con chaflán guía en la boca (entrada del tornillo)
    // se llama apuntando hacia "afuera": chaflan primero, luego cilindro recto
    module agujero_piloto(h_total) {
        union() {
            // chaflán cónico (boca ancha -> boca del diámetro del piloto)
            cylinder(d1=chaflan_diam, d2=ROSCA_DIAMETRO_PILOTO, h=chaflan_alto);
            // resto del agujero, recto
            translate([0, 0, chaflan_alto - 0.01])
                cylinder(d=ROSCA_DIAMETRO_PILOTO, h=h_total - chaflan_alto + 0.01);
        }
    }
    
    module cuerpo() {
        difference() {
            union() {
                // cascarón hueco, con esquinas exteriores redondeadas
                difference() {
                    caja_redondeada(ancho, altura, profundidad, radio_esquina);
                    translate([pared, pared, -1])
                        cube([
                            ancho - 2 * pared,
                            altura - 2 * pared,
                            profundidad + 2
                        ], center=false);
                }
                
                // bosses arriba
                for (p = posiciones_tornillos)
                    translate([p[0], p[1], profundidad - ROSCA_ALTURA])
                        cylinder(d = ROSCA_DIAMETRO, h = ROSCA_ALTURA);
                
                // bosses abajo
                for (p = posiciones_tornillos)
                    translate([p[0], p[1], 0])
                        cylinder(d = ROSCA_DIAMETRO, h = ROSCA_ALTURA);
            }
            
            // agujeros piloto en los bosses, con chaflán en cada boca exterior
            for (p = posiciones_tornillos) {
                // boca superior: chaflán mirando hacia +Z (hacia afuera)
                translate([p[0], p[1], profundidad - chaflan_alto])
                    agujero_piloto(ROSCA_ALTURA + chaflan_alto + 1);
                
                // boca inferior: chaflán mirando hacia -Z (hacia afuera),
                // se logra invirtiendo el cono con mirror()
                translate([p[0], p[1], chaflan_alto])
                    mirror([0, 0, 1])
                        agujero_piloto(ROSCA_ALTURA + chaflan_alto + 1);
            }
            
            // agujeros de montaje al riel eurorack (pasantes, sin rosca)
            for (p = posiciones_riel)
                translate([p[0], p[1], -1])
                    cylinder(d = M3_DIAMETRO_HOLGURA, h = profundidad + 2);
        }
    }
    
    module tapa_panel() {
        difference() {
            cube([ancho, altura, tapa], center=false);
            for (p = posiciones_tornillos)
                translate([p[0], p[1], -1])
                    cylinder(d = M3_DIAMETRO_HOLGURA, h = tapa + 2);
        }
    }
    
    cuerpo();
    
    translate([0, 0, profundidad + 5])
        tapa_panel();
    
    translate([0, 0, -tapa - 5])
        tapa_panel();
}

relo();