#!/bin/bash

AGENT=DETUNED_TOTALWAIT
MAP=ingolstadt21
TR=0
TRIALS=10
PROCS=5
EPISODES=100

python3 main.py \
--agent=${AGENT} \
--map=${MAP} \
--tr=${TR} \
--procs=${PROCS} \
--trials=${TRIALS} \
--eps=${EPISODES}