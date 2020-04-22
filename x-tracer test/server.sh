#!/bin/bash
base_port=6000
#netserver_port=7000
num_servers=100
for i in `seq 1 $num_servers`; do

	# Set server port
	server_port=$(($base_port+$i));

	# Run iperf
	iperf3 -s -p $server_port -D

#	netserver_port=$(($base_port-$i));
	#echo nerserver_port
#	netserver -p $netserver_port 

done
