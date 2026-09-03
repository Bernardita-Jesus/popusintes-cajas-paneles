// constantes.scad

// constantes mecanicas eurorack
// medidas en mm
MODULO_ANCHO = 5.08;
MODULO_ALTURA_3U  = 128.4;

// caja medidas ideales, internas
CAJA_ANCHO = MODULO_ANCHO;
CAJA_ALTURA = MODULO_ALTURA_3U;
CAJA_PROFUNDIDAD = 20.0;
// medidas de pared de caja en mm
CAJA_PARED = 2.0;

// panel medidas ideales, exteriores
PANEL_ANCHO = MODULO_ANCHO;
PANEL_ALTURA = MODULO_ALTURA_3U;
PANEL_PROFUNDIDAD = 3.0;

// constantes para panel
// perilla
 RADIO_PERILLA_CHICA = 5;

// radio de redondeo de las esquinas del panel
RADIO_BORDE_PANEL = 2;


// margenes de los tornillos segun ejemplo vcv
// medidos en mm
MARGEN_X = 7.5;
MARGEN_Y = 3;


// constantes tornillos M3
// medidas en mm
M3_DIAMETRO_PASO = 2.6;
M3_DIAMETRO_ = 3.4;

// constantes para agujeros de conectores en paneles
// medidas en mm
PANEL_ESPESOR = 2;
ALTURA_AGUJERO_CONECTOR = 30;
RADIO_AGUJERO_LED = 1.53; // PORHACER: ajustar tamanhos de perforaciones
RADIO_AGUJERO_JACK = 3.8; // jack ts, diametro 7.6mm medido
RADIO_AGUJERO_BOTON = 4.4;
RADIO_AGUJERO_PERILLA = 3.05; // perilla, diametro 6.1mm medido: unico tamanho para grande y chica

// agujeros de componentes que rack/ usa pero que todavia no tenian
// tamano aca: estimados a partir del tamano relativo de cada
// componente en vcv (RoundBlackKnob 38px, RoundSmallBlackKnob 28px,
// Trimpot 17px), a falta de medidas de las piezas fisicas. ajustar
// tras probar con componentes reales
RADIO_AGUJERO_PERILLA_CHICA = RADIO_AGUJERO_PERILLA; // mismo tamanho que la perilla grande
RADIO_AGUJERO_TRIMPOT = 2.5;

// constantes roscas M3
// medidas en mm
// rosca usada como traduccion de boss
ROSCA_DIAMETRO = 2;
ROSCA_ALTURA = 6;
ROSCA_TOLERANCIA = 5;
ROSCA_DIAMETRO_PILOTO = 2.6;
