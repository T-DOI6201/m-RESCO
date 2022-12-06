#!/bin/bash
#5-agent * 100-episodes * 10-trials
export SUMO_HOME=/usr/share/sumo

for agent in NoActIndex NoApproach NoTotalWait NoQueue NoTotalSpeed
do
    export GPU_NUMBER=0
    python3 main.py --agent=${agent} --trials=20 --procs=10 --map=cologne8 --memo=
done