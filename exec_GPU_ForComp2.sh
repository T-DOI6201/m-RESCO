#!/bin/bash
#5-agent * 100-episodes * 10-trials
export SUMO_HOME=/usr/share/sumo

python3 main.py --agent=IDQN --trials=10 --procs=10 --map=cologne8 --memo=totalSpeed_totalWait_queue_approach
python3 main.py --agent=DETUNED_TOTALWAIT_QUEUE_APPROACH --trials=10 --procs=10 --map=cologne8 --memo=totalWait_queue_approach
python3 main.py --agent=DETUNED_TOTALWAIT_QUEUE --trials=10 --procs=10 --map=cologne8 --memo=totalWait_queue
python3 main.py --agent=DETUNED_TOTALWAIT --trials=10 --procs=10 --map=cologne8 --memo=totalWait
