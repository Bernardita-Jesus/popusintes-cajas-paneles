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

Esto deja los archivos en `stl/`. También se puede filtrar por nombre de pieza, por ejemplo `./scripts/exportar-stl.sh relo` exporta solo `relo_caja.stl` y `relo_panel.stl`. Requiere tener `openscad` instalado (en Mac, si no está en el `PATH`, el script busca automáticamente `/Applications/OpenSCAD.app`).

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
- [pane](./pane/)
- [recta](./recta/)
- [relo](./relo/)
- [rerelo](./rerelo/)
- [secu](./secu/)
- [suma](./suma/)

## Licencia

MIT
