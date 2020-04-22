#!/bin/bash

server_port=$1

for (( ; ;))
do

iperf3 -c localhost -p $server_port -t 3 


done

