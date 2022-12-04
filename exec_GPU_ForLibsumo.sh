#!/bin/bash
#using libsumo
#100-episodes * 20-trials 

export SUMO_HOME=/usr/share/sumo
export -n LIBSUMO_AS_TRACI

AGENT=IDQN
MAP=cologne8
USE_LIBSUMO=YES
MEMO=Default


while getopts a:m:li:t:p:e:M: option
do
	case $option in
		a)
			AGENT=${OPTARG};;
		m)
			MAP=${OPTARG};;
		l)
			USE_LIBSUMO=YES
			export LIBSUMO_AS_TRACI=YES;;
		M)
			MEMO=${OPTARG};;
	esac
done	


for var in `seq 10`
do
    bash exec.sh -a ${AGENT} -m ${MAP} -l -i ${var} -M ${MEMO}
done
