#!/bin/bash
# Needs gualcleaner, pip, zenity installed
clear
echo -e "================================================.\n     .-.   .-.     .--.                         |\n    | OO| | OO|   / _.-' .-.   .-.  .-.   .''.  |\n    |   | |   |   \  '-. '-'   '-'  '-'   '..'  |\n    '^^^' '^^^'    '--'                         |\n===============.  .-.  .================.  .-.  |\n               | |   | |                |  '-'  |\n               | |   | |                |       |\n               | ':-:' |                |  .-.  |\n               |  '-'  |                |  '-'  |\n==============='       '================'       |\n"
echo -e "Porfavor escoja una opción:"
#PS3='Porfavor escoja una opción' \n
options=("Escanear carpeta Descargas" "Arrastrar archivos" "Seleccionar direcotrio" "Salir")
select opt in "${options[@]}"
do
    case $opt in
        "Escanear carpeta Descargas")
            find /Users/username/Downloads/ -name "free-*.pdf" -print0 | while read -d $'\0' file
                do
                    gulagcleaner "$file"
                done

                exit
            ;;
        "Arrastrar archivos")
            echo "Hola! Arrastra y suelta los archivos que quieras aqui:"
            IFS="" read -r input
            eval "files=( $input )"

            for file in "${files[@]}"
            do
                 gulagcleaner "$file"
                 #rm "$file"
            done

            exit
            ;;
        "Seleccionar direcotrio")
                
                DIR=$(zenity --file-selection \
                    --title="Wuolah Remover" \
                    --height=200 \
                    --width=100 \
                    --text="Selecciona un directorio:" \
                    --directory)
            find $DIR -name "free-*.pdf" -print0 | while read -d $'\0' file
                do
                    gulagcleaner "$file"
                done

                exit
            ;;
        "Salir")
            break
            ;;
        *) echo "Opción inválida $REPLY";;
    esac
done