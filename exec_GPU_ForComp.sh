#!/bin/bash
#5-agent * 100-episodes * 10-trials
export SUMO_HOME=/usr/share/sumo

for agent in DETUNED_150 DETUNED_100 DETUNED_50 DETUNED_10
do
    export GPU_NUMBER=0
    python3 main.py --agent=${agent} --trials=10 --procs=10 --map=cologne8 --memo=${agent}
done