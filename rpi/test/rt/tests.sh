#!/bin/bash
dd bs=16M if=/dev/urandom of=/dev/null &
# 1.- Política de planificación: SCHED_OTHER
sudo ~/rt-tests/cyclictest -l 12000 -i 5000 -n -q -H 200 > histo_raw.dat
echo 'set term png; set output "histo_raw.png"; set xlabel "Latencia (us)"; plot "histo_raw.dat" title "SCHED_OTHER" with linespoints lc rgb "blue";' | gnuplot
pkill -u pi dd
