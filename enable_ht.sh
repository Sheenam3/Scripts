#!/bin/bash

if [[ $# != 2 ]] || [[$1 == "--help"]]; then
        printf "options:--help \nUsage Information: $0 <START RANGE> <END RANGE> \nFor example: ./enable_ht.sh 24 47 \n"
        exit 1
fi

for i in $(eval echo {$1..$2}); do
   printf "Enabling HT on CPUs $i \n"
   echo 1 > /sys/devices/system/cpu/cpu$i/online;
done

