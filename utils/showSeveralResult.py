import os
import numpy as np
import sys
import matplotlib
matplotlib.use('TkAgg')
import matplotlib.pyplot as plt

log_dir = os.path.join(os.path.dirname(os.path.dirname(os.getcwd())), 'results_modified' + os.sep)
#by using dirname twice, able to see 2 levels-up directory ?

result_list = []
memo_list = []
for i in range(1,len(sys.argv)):
    dir_name = sys.argv[i]
    split_name = dir_name.split('-')
    print(split_name)
    map_name = split_name[2]
    average_per_episode = []

    for i in range(1, 10000):
        trip_file_name = log_dir+dir_name + os.sep + 'metrics_'+str(i)+'.csv'
        if not os.path.exists(trip_file_name):
            print('No '+trip_file_name)
            break

        num_steps, total = 0, 0.0 #total is sum of queue_lengths observed in one episode normalized by the number of the signals
        last_departure_time = 0
        last_depart_id = ''
        with open(trip_file_name) as fp:
            reward, wait, steps = 0, 0, 0
            for line in fp:
                line = line.split('}')
                queues = line[2] #line[1] -> switch to plot average-max-queue-length graph
                signals = queues.split(':')
                step_total = 0
                for s, signal in enumerate(signals):
                    if s == 0: continue
                    queue = signal.split(',')
                    queue = int(queue[0])
                    step_total += queue
                step_avg = step_total / len(signals) #culculate average sum-queue-length of all signals at the particular step
                total += step_avg
                num_steps += 1 #count step up

        average = total / num_steps
        average_per_episode.append(average)

    #run_name = split_name[0]+' '+split_name[2]+' '+split_name[3]+' '+split_name[4]+' '+split_name[5] #+' '+split_name[6]
    if(len(split_name) >= 7): memo_list.append(split_name[6])
    else: memo_list.append(split_name[4])
    average_per_episode = np.asarray(average_per_episode)
    result_list.append(average_per_episode)

plt.title("Combine Plots")

for i in range(0, len(sys.argv)-1):
    plt.plot(result_list[i])
plt.legend(memo_list)
plt.xlabel('episodes')
plt.ylabel('average queue-length')
plt.show()