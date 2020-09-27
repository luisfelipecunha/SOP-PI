#!/bin/bash
#######################################################################
#run-ramspeed-PI-4.sh                                                 #
#                                                                     #
#######################################################################

#Executa o RAMSpeed/SMP 30 vezes
FILE="consumo_memoria".csv

function calc_float() {
	awk "BEGIN {print $*}"
}

function consumo_memoria() {
	if [ ! -f "${FILE}" ]; then
		touch $FILE
	fi
	mem_total=$(grep MemTotal /proc/meminfo | awk '{print $2 / 1024}')
	mem_livre=$(grep MemAvailable /proc/meminfo | awk '{print $2 / 1024}')
	mem_utilizada=$(calc_float $mem_total - $mem_livre)
	echo "${mem_utilizada}" >>$FILE
}

cd ramspeed-smp-master/
for i in $(seq 1 30); do
	./ramsmp -b 6 -g 2
	consumo_memoria
done
