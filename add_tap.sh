#!/bin/bash

if [[ $# != 3 ]]; then
	echo "Usage: $0 <Bridge Name> <Tap interface name> <Iface name to be added to the bridge>"
	exit 1
fi

br_name=$1
tap_name=$2
br_iface=$3

#Create a bridge
brctl addbr ${br_name}

#Clear interface ip
ip addr flush dev ${br_iface}

#Add interface to the created bridge
brctl addif ${br_name} ${br_iface}

#Add tap to bridge
tunctl -t ${tap_name} -u `whoami`

#Add tap interface to the bridge
brctl addif ${br_name} ${tap_name}

#Turn all up
ifconfig ${br_name} up
ifconfig ${tap_name} up
ifconfig ${br_iface} up

#Show the output
echo "${tap_name} has been added to the ${br_name}"
echo "------------------------------------------------------"
brctl show
echo "------------------------------------------------------"
ifconfig 
echo "------------------------------------------------------"

