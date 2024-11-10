#!/bin/bash

label=(us sy ni id wa hi si st)

get_cpu_values() {
    # user system nice idle iowait irq softirq steal
    awk '/^cpu / {print $2, $4, $3, $5, $6, $7, $8, $9}' /proc/stat
}

calc_perc() {
    awk -v val="$1" -v td=$tdiff 'BEGIN {printf "%4.1f\n", val * 100 / td}'
}

prev=($(get_cpu_values))
sleep 0.1
curr=($(get_cpu_values))

for i in {0..7}; do
    diff[i]=$((curr[i] - prev[i]))
    tprev=$((tprev + prev[i]))
    tcurr=$((tcurr + curr[i]))
done

tdiff=$((tcurr - tprev))

echo -n '%CPU(s):'

for i in {0..7}; do
    [[ i -eq 7 ]] && sep=$'\n' || sep=', '
    printf "%s %s$sep" "$(calc_perc ${diff[i]})" ${label[i]}
done

