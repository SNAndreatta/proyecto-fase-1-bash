# Proyecto Fase 1 Bash

**Plan**: (INF-2023) 2023.

**Propuesta**: Ingeniería en Informática.

**Actividad**: (TB022) Introducción al Desarrollo de Software - FIUBA.

**Comisión**: Curso 2 - Lanzillotta.

**Período**: 2026 - 2do Cuatrimestre.

## Como correr

Para correr el script solo con el menú de opciones.
``` bash
chmod +x main.sh
./main.sh
```

Y tambien para utilizar la flag "-d" para matar los procesos y borrar el entorno.
``` bash
./main.sh -d
```

## Utils

Si querés establecer FILENAME desde fuera del script.

``` bash
export FILENAME="loquequieras"
```

También en la carpeta utils hay un script para crear 2 archivos de entrada.

``` bash
chmod +x utils/archivos_entrada.sh
./utils/archivos_entrada.sh
```
