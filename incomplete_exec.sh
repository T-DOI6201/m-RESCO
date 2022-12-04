#!/bin/bash

#This shell-script is incomplete

export -n LIBSUMO_AS_TRACI

AGENT=IDQN
MAP=cologne1
USE_LIBSUMO=NO
TR=0

while getopts a:m:ln: option
do
	case $option in
		a)
			AGENT=${OPTARG};;
		m)
			INPUT_MAP=${OPTARG}
			if [ ${INPUT_MAP} = "cs" ]; then MAP=cologne1
			elif [ ${INPUT_MAP} = "cc" ]; then MAP=cologne3
			elif [ ${INPUT_MAP} = "cr" ]; then MAP=cologne8
			elif [ ${INPUT_MAP} = "is" ]; then MAP=ingolstadt1
			elif [ ${INPUT_MAP} = "ic" ]; then MAP=ingolstadt7
			elif [ ${INPUT_MAP} = "ir" ]; then MAP=ingolstadt21
			else
				echo "Undefined map"; exit 1
			fi
		l)
			USE_LIBSUMO=YES
			export LIBSUMO_AS_TRACI=YES;;
		n)
			TR=${OPTARG};;
	esac
done	

if [ ${USE_LIBSUMO} = "YES" ]; then
	python3 main.py --agent=${AGENT} --map=${MAP} --libsumo=True --tr=${TR}
else
	python3 main.py --agent=${AGENT} --map=${MAP} --tr=${TR}
fi
