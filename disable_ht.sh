#!/bin/bash

if [[ $# != 2 ]] || [[$1 == "--help"]]; then
	printf "options:--help \nUsage Information: $0 <From which CPU ID(start CPU_ID)> <To which CPU ID(last CPU_ID> \nFor example: ./disable_ht.sh 24 47 \n"
	exit 1
fi

for i in $(eval echo {$1..$2}); do
   printf "Disabling HT Core $i \n"
   echo 0 > /sys/devices/system/cpu/cpu$i/online;
done

