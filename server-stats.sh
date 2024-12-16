#!/bin/sh

#1.Total CPU usage

top -o +%CPU -Em -n1 | grep 'Cpu' | awk '{print "Current CPU usage:" $2 "%"}'
echo

#2. Total memory usage(Free vs Used including %)
echo Memory usage
free -m | grep Mem | awk '{printf "Total: %1.fMb\tFree: %1.fMb (%.2f%%)\tUsed: %1.fMb (%.2f%%)\n", $2, $2-$3,($2 - $3)/$2 * 100, $3, $3/$2 *100}'
echo

#3 Total disk usage
echo Disk usage
df -m | grep "/" -w | awk '{printf "Total: %1.fMb\tFree: %1.fMb (%.2f%%)\tUsed: %1.fMb (%.2f%%)\n", $2, $2-$3,($2 - $3)/$2 * 100, $3, $3/$2 *100}'
echo

#4 Top 5 procesess by CPU usage

echo 'Top 5 procesess by CPU usage'
top -o +%CPU -Em -n1 |awk '{print $13 " " $10 "%" }' | sed -n '8,12p'
echo

#5 Top 5 procesess by memory usage

echo 'Top 5 procesess by memory usage'
top -o +%MEM -Em -n1 |awk '{print $13 " " $11 "%" }' | sed -n '8,12p'
