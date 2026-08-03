# popusintes-cajas-paneles

cajas y paneles paramétriques en OpenSCAD

## Desarrollo

Este repositorio contiene los archivos escritos en OpenSCAD para generar cajas y paneles para el proyecto Popusintes, una colección de sintetizadores modulares

Al clonar el repositorio, ejecutar este comando una vez para activar el hook de pre-commit que corrige automáticamente estilo en los archivos `.scad`:

```bash
git config core.hooksPath .githooks
```

## Estructura del repositorio

### Configuracion

- [.github/](./.github/): archivos de configuración y automatizaciones para GitHub.
- [scripts/](./scripts/): scripts para mantenimiento y linting de los archivos.
- [LICENSE](./LICENSE): licencia del repositorio.
- [README.md](./README.md): este archivo, con información del repositorio.
- [comun/](./comun/): archivos comunes a todas las cajas y paneles, con constances y funciones.

### Cajas y paneles de los módulos

- [bote](./bote/)
- [recta](./recta/)
- [relo](./reloj/)

## Licencia

MIT
