#!/bin/bash 
clear
echo -e "================================================.\n     .-.   .-.     .--.                         |\n    | OO| | OO|   / _.-' .-.   .-.  .-.   .''.  |\n    |   | |   |   \  '-. '-'   '-'  '-'   '..'  |\n    '^^^' '^^^'    '--'                         |\n===============.  .-.  .================.  .-.  |\n               | |   | |                |  '-'  |\n               | |   | |                |       |\n               | ':-:' |                |  .-.  |\n               |  '-'  |                |  '-'  |\n==============='       '================'       |\n"
echo "Hola! Arrastra y suelta los archivos que quieras aqui:"
IFS="" read -r input
eval "files=( $input )"

for file in "${files[@]}"
do
     gulagcleaner "$file"
     #rm "$file"
done

exit