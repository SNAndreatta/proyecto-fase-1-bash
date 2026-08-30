#!/bin/bash

while true; do 
    for file in "$HOME/EPNro1/entrada/"*.txt; do
        if [ -f "$file" ]; then
            
            nombre=$(basename "$file")
            
            cat "$file" >> "$HOME/EPNro1/salida/$FILENAME.txt"
            echo "" >> "$HOME/EPNro1/salida/$FILENAME.txt" # Por si el archivo.txt esta mal formateado y se solapan las entradas de los archivos de texto por no terminar en un salto de linea

            mv "$file" "$HOME/EPNro1/procesado/"
            
            fecha=$(date "+%d/%m/%Y %H:%M:%S")
            echo "$fecha - Procesado archivo $nombre" >> "$HOME/EPNro1/procesado.log"
        fi
    done
    
    sleep 1
done