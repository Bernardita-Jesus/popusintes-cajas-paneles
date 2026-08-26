// versiones.scad

include <./constantes.scad>

// version compartida por todas las cajas y paneles: un solo string,
// grabado igual en cada pieza exportada
VERSION = "v0.0.4";

BOTE_TEXTO = "bote";

ATACONSO_TEXTO = "ataconso";
ATACONSO_HP = 4;

COMPA_TEXTO = "compa";
COMPA_HP = 4;

ENVO_TEXTO = "envo";
ENVO_HP = 4;

PANE_TEXTO = "pane";
PANE_HP = 5;

RECTA_TEXTO = "recta";
// 4 hp, igual que dimensiones::RECTA_ANCHO en rack/ (antes decia 6,
// no coincidia con rack: corregido al portar el layout real del panel)
RECTA_HP = 4;

RELO_TEXTO = "relo";
RELO_HP = 4;

RERELO_TEXTO = "rerelo";
RERELO_HP = 8;

SECU_TEXTO = "secu";
SECU_HP = 8;

SUMA_TEXTO = "suma";
SUMA_HP = 4;

// versiones v0.0.x
// pruebas de tamano
// realizadas entre julio y agosto 2026
