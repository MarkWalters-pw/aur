#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <network_device>"
    exit 1
fi

DEVICE=$1
GATEWAY=$(ip route | grep "^default" | grep "$DEVICE" | awk '{print $3}')

if [ -z "$GATEWAY" ]; then
    echo "No gateway found for device $DEVICE."
    exit 1
else
    echo "Gateway for device $DEVICE: $GATEWAY"
fi
