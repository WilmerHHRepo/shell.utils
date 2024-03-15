#!/bin/bash

cmd=$1
repo=$2 #RUTA DE CARPETA ABUSCAR

RED='\033[0;31m'
GREEN='\033[0;32m'
CELESTE='\e[36m'
NC='\033[0m'

a=$(ls)
echo -e "${RED}REPOS: ==================================================== INICIO${NC}"
while read -r msj_ms;
do
	echo -e "${msj_ms}"
done < <(printf '%s\n' "$a" | grep $repo)


while read -r msj_ms;
do
	#ms=$(echo $msj_ms | cut -d"/" -f 1)
	#mso=$(echo $ms | cut -d"1" -f 1)
	#pod=$(echo $mso | tr -d '[[:space:]]')
	
	echo -e "${GREEN}-------------------------------------------------- GIT PULL${NC}"
	
	#ms_pod=$(kubectl logs $pod |grep ERROR | sort | uniq -c)
	#
	
	echo -e "${GREEN}${msj_ms}${NC}"
	cd $msj_ms
	git $cmd
	cd ..
	#length=$(echo $ms | wc -c)
	#echo $length
	#echo "MS2:$ms"

done < <(printf '%s\n' "$a" | grep $repo)

