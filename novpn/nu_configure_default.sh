#!/bin/bash

DEVICE=$(ip route | grep default | awk '{print $5}')
GATEWAY=$(ip route | grep "^default" | grep "$DEVICE" | awk '{print $3}')

if [ -z "$DEVICE" ]; then
    echo Failed to find default device >&2
fi
if [ -z "$GATEWAY" ]; then
    echo Failed to find default gateway >&2
fi

echo "Device: $DEVICE"
echo "Gateway: $GATEWAY"

rm -f /etc/novpn
touch /etc/novpn
echo "# `novpn` will route its traffic via this device and gateway." >> /etc/novpn
echo "DEV	$DEVICE" >> /etc/novpn
echo "GATEWAY	$GATEWAY" >> /etc/novpn
echo >> /etc/novpn
echo "# Name of network namespace and its subnet mask." >> /etc/novpn
echo "NS	novpn_ns" >> /etc/novpn
echo "SUBNET	192.168.80.0/30" >> /etc/novpn

echo "New configuration saved to /etc/novpn"
