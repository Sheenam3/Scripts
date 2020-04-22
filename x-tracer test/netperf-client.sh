#!/bin/bash

port_num=$1
shift

for (( ; ;))

do

netperf -H localhost -l 2 -t TCP_RR -p $port_num

done
