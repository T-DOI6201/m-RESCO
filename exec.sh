#!/bin/bash

export SUMO_HOME=/usr/share/sumo
export -n LIBSUMO_AS_TRACI

AGENT=IDQN
MAP=cologne1
USE_LIBSUMO=NO
TR=0
TRIALS=1
PROCS=1
MEMO=Default
EPISODES=100

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
		i)
			TR=${OPTARG};;
		t)
			TRIALS=${OPTARG};;
		p)
			PROCS=${OPTARG};;
		e)
			EPISODES=${OPTARG};;
		M)
			MEMO=${OPTARG}
	esac
done	

if [ ${USE_LIBSUMO} = "YES" ]; then
	python3 main.py --agent=${AGENT} --map=${MAP} --libsumo=True --tr=${TR} --trials=${TRIALS} --eps=${EPISODES} --memo=${MEMO}
else
	python3 main.py --agent=${AGENT} --map=${MAP} --tr=${TR} --procs=${PROCS} --trials=${TRIALS} --eps=${EPISODES} --memo=${MEMO}
fi
