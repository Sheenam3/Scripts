#!/bin/bash

if [[ $# != 2 ]]; then
        echo "Usage: $0 <Bridge Name> <Tap interface name>"
        exit 1
fi

br_name=$1
tap_name=$2


ifconfig ${br_name} down

#Remove tap interface from bridge
brctl delbr ${br_name} 
tunctl -d ${tap_name}

brctl show


