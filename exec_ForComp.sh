#!/bin/bash
#4-agent * 100-episodes * 10-trials

for agent in IDQN DETUNED_TOTALWAIT_QUEUE_APPROACH DETUNED_TOTALWAIT_QUEUE DETUNED_TOTALWAIT
do
    for var in `seq 10`
    do
        bash exec.sh -a ${agent} -m ingolstadt21 -l -i ${var} 
    done
done