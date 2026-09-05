# popusintes-cajas-paneles

cajas y paneles paramétriques en OpenSCAD

## Desarrollo

Este repositorio contiene los archivos escritos en OpenSCAD para generar cajas y paneles para el proyecto Popusintes, una colección de sintetizadores modulares

Al clonar el repositorio, ejecutar este comando una vez para activar el hook de pre-commit que corrige automáticamente estilo en los archivos `.scad`:

```bash
git config core.hooksPath .githooks
```

Para exportar todas las cajas y paneles a `.stl` con un solo comando:

```bash
./scripts/exportar-stl.sh
```

Esto deja los archivos en `stl-<version>/`, donde `<version>` es el valor de `VERSION` en [comun/versiones.scad](comun/versiones.scad) — la misma que se graba en cada pieza. Al cambiar `VERSION` y volver a exportar, se genera una carpeta `stl-<version>/` nueva. También se puede filtrar por nombre de pieza, por ejemplo `./scripts/exportar-stl.sh relo` exporta solo `relo_caja.stl` y `relo_panel.stl`. Requiere tener `openscad` instalado (en Mac, si no está en el `PATH`, el script busca automáticamente `/Applications/OpenSCAD.app`).

## Estructura del repositorio

### Configuracion

- [.github/](./.github/): archivos de configuración y automatizaciones para GitHub.
- [scripts/](./scripts/): scripts para mantenimiento, linting y exportado a `.stl` de los archivos.
- [LICENSE](./LICENSE): licencia del repositorio.
- [README.md](./README.md): este archivo, con información del repositorio.
- [comun/](./comun/): archivos comunes a todas las cajas y paneles, con constances y funciones.

### Cajas y paneles de los módulos

- [bote](./bote/)
- [ataconso](./ataconso/)
- [compa](./compa/)
- [envo](./envo/)
- [grilla](./grilla/)
- [pane](./pane/)
- [recta](./recta/)
- [relo](./relo/)
- [rerelo](./rerelo/)
- [secu](./secu/)
- [suma](./suma/)

## Versiones

La versión vive en `VERSION` en [comun/versiones.scad](comun/versiones.scad), se graba en cada pieza y da nombre a la carpeta `stl-<version>/` que genera el script de exportado.

- **v0.0.7**: se unifica la perilla a un solo tamaño. Antes había `agujero_perilla_grande` (RoundBlackKnob) y `agujero_perilla_chica` (RoundSmallBlackKnob); ahora existe un único módulo `agujero_perilla` (Ø 6.1 mm) que usan todos los paneles. Las perforaciones se probaron renderizando los dos tamaños del panel `grilla` (4 hp y 8 hp) con OpenSCAD. STL en `stl-v0.0.7/`.
- **v0.0.x** (julio–agosto 2026): pruebas de tamaño.

## Licencia

MIT
