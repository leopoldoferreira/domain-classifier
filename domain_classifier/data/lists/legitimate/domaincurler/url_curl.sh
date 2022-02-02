#!/bin/bash

# Execução: ./url_ping.sh [lista_url] [n_threads]

# função que executa as consultas
url_request(){
	# laço de repetição que itera sobre cada url da lista de entrada
	while IFS= read -r url
	do
        	# faz uma requisição HTTP do tipo GET para a URL e filtra apenas o código de retorno
		# aguarda no máximo 3 segundos por uma resposta
        	echo "curl $url ..."
        	response_code=$(curl -m 3 -o /dev/null -sw '%{http_code}' $url)

        	# se o código retornado pelo comando for 000 a URL sendo requisitada não foi encontrada
		# caso contrário, para qualquer outro código fornecido como resposta, 200, 301, 302, 404, etc.,
		# significa que houve resposta do servidor para a requisição (mesmo que haja algum tratamento)
        	if [[ "$response_code" -eq "000" ]]; then
        	        echo $url >> $1".notfound.txt"
        	else
        	        echo $url >> $1".found.txt"
        	fi
	done < "$1" # parâmetro referente a lista de entrada
}

# quantidade de linhas no arquivo
r_file=$(cat $1 | wc -l)

# quantas partes o arquivo será dividido, especificado pelo segundo parâmetro - default 1
n_threads=${2:-1}

# quantas linhas do arquivo cada thread irá processar
s_rows=$(( r_file / n_threads ))

# cria arquivos temporários contendo a lista de urls a serem processadas por cada thread
r_start=1
r_end=$s_rows
for i in $( seq 1 $n_threads); do
	tmp_name=$1".tmp."$i
	echo "[+] creating file "$tmp_name
	sed -n $r_start,$r_end"p" $1 > $tmp_name
	tmp_files+=($tmp_name)

	r_start=$(( $r_end + 1 ))
	r_end=$(( $r_end + $s_rows ))
done
#echo ${tmp_files[@]}

# laço de repetição que itera sobre cada arquivo temporário gerado
for i in ${tmp_files[@]}; do
	url_request $i &
done;

