#!/bin/bash

if [ -z "$FILENAME" ]; then
    export FILENAME="output"
fi

if [ "$1" == "-d" ]; then
    echo "Destruyendo entorno y deteniendo procesos..."
    pkill -f "consolidar.sh" 2>/dev/null
    rm -rf "$HOME/EPNro1/"
    echo "Entorno eliminado exitosamente."
    exit 0
fi

opcion=0

while [ "$opcion" != 7 ]; do

    echo "1) Crear entorno"
    echo "2) Correr proceso"
    echo "3) Mostrar listado ordenado por padrón"
    echo "4) Mostrar las 10 notas más altas"
    echo "5) Buscar datos por número de padrón"
    echo "6) Visualizar log"
    echo "7) Salir"
    read -p "Selecciona una opción: " opcion

    case $opcion in
        # Crear entorno
        1)
            clear
            mkdir "$HOME/EPNro1/" "$HOME/EPNro1/entrada" "$HOME/EPNro1/salida" "$HOME/EPNro1/procesado"
            if [ -f "consolidar.sh" ]; then
                cp "consolidar.sh" "$HOME/EPNro1/consolidar.sh"
                chmod +x "$HOME/EPNro1/consolidar.sh"
                echo "Entorno creado y script copiado con éxito."
            else
                echo "Error: No se encontró 'consolidar.sh' en el directorio actual."
            fi
            ;;
        # Iniciar el proceso en background
        2)
            clear
            if [ -f "$HOME/EPNro1/consolidar.sh" ]; then
                echo "Iniciando proceso en background..."
                "$HOME/EPNro1/consolidar.sh" &
            else
                echo "No existe el script. Tenes que crear el entorno"
            fi
            ;;
        # Mostrar listado ordenado por padrón
        3)
            clear
            if [ -d "$HOME/EPNro1" ]; then
                if [ -f "$HOME/EPNro1/salida/$FILENAME.txt" ]; then
                    sort -n -k1 "$HOME/EPNro1/salida/$FILENAME.txt"
                else 
                    echo "El archivo no existe"
                fi
            else
                echo "No está creado el entorno. Tenés que crearlo."
            fi
            ;;
        # Mostrar las 10 notas más altas
        4)
            clear
            if [ -d "$HOME/EPNro1" ]; then

                if [ -f "$HOME/EPNro1/salida/$FILENAME.txt" ]; then
                    sort -k5 -n -r "$HOME/EPNro1/salida/$FILENAME.txt" | head -n 10

                else
                    echo "El archivo no existe"

                fi
            else
                echo "No está creado el entorno. Tenés que crearlo."
            fi
            ;;
        # Buscar datos por número de padrón
        5)
            clear
            if [ -d "$HOME/EPNro1" ]; then
                archivo="$HOME/EPNro1/salida/$FILENAME.txt"

                if [ -f "$archivo" ]; then
                    read -p "Ingrese el numero del padron: " padron
                    
                    resultado=$(grep "^$padron " "$archivo")

                    if [ -n "$resultado" ]; then
                        echo "$resultado"
                    else
                        echo "No se encontro el padron"

                    fi        

                else
                    echo "El archivo no existe"
                fi
            else
                echo "No está creado el entorno. Tenés que crearlo."
            fi
            ;;
        # Visualizar log
        6)
            clear
            if [ -d "$HOME/EPNro1" ]; then
                if [ -f "$HOME/EPNro1/procesado.log" ]; then

                    echo "Archivo de logs"
                    cat "$HOME/EPNro1/procesado.log"
                else
                    echo "El archivo de logs no existe"
                fi
            else
                echo "No está creado el entorno. Tenés que crearlo."
            fi
            ;;
        # Salir del programa¿
        7)
            clear
            echo "Saliendo..."
            ;;
        # Si la opción ingresada no es un nro del 1 al 7
        *)
            clear
            echo "Por favor ingresar un número del 1 al 7"
            ;;
    esac
done

exit 0