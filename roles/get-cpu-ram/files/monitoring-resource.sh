#!/bin/sh
ramusage=$(free -m | awk 'NR==2{printf "Memory Usage: %s/%sMB (%.2f%%)\n", $3,$2,$3*100/$2 }')
cpuload=$(cat /proc/loadavg |awk '{print $3}')
cpuusage=$(top -b -n2 -p 1 | fgrep "Cpu(s)" | tail -1 | awk -F'id,' -v prefix="$prefix" '{ split($1, vs, ","); v=vs[length(vs)]; sub("%", "", v); printf "%s%.1f%%\n", prefix, 100 - v }')
timeos=$(date +"%d/%m/%Y  %T")
hostname=$(uname -n)
echo "---------------------------------------" >> /root/VMware-$hostname
echo $timeos >> /root/VMware-$hostname
echo "CPU Load: "%$cpuload >> /root/VMware-$hostname
echo "CPU Usage: "$cpuusage >> /root/VMware-$hostname
echo $ramusage >> /root/VMware-$hostname