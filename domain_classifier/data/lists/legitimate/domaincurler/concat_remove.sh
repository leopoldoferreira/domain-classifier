#!/bin/bash

# Execução: ./concat.sh [lista_url]

# lista todos os arquivos .tmp
tmp=$( ls $1.tmp* )

# lista todos os arquivo .tmp.found
tmp_found=$( ls $1.tmp.[0-9]*.found* )

# lista todos os arquivo .tmp.notfound
tmp_notfound=$( ls $1.tmp.[0-9]*.notfound* )

# concatena todos os .found e .notfound encontrados
if [[ ${tmp_found[@]} ]]; then
	echo "[+] concating files to $1.found.txt"
	cat $tmp_found > $1.found.txt
fi

if [[ ${tmp_notfound[@]} ]]; then
	echo "[+] concating files to $1.notfound.txt"
	cat $tmp_notfound > $1.notfound.txt
fi

# remove todos os arquivo temporarios
for i in ${tmp[@]}; do
	echo "[-] removing $i"
	rm $i
done


echo "done!"

