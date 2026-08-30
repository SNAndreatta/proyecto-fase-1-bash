#!/bin/bash

while true; do 
    for file in "$HOME/EPNro1/entrada/"*.txt; do
        if [ -f "$file" ]; then
            
            nombre=$(basename "$file")
            
            cat "$file" >> "$HOME/EPNro1/salida/$FILENAME.txt"

            mv "$file" "$HOME/EPNro1/procesado/"
            
            fecha=$(date "+%d/%m/%Y %H:%M:%S")
            echo "$fecha - Procesado archivo $nombre" >> "$HOME/EPNro1/procesado.log"
        fi
    done
    
    sleep 1
done