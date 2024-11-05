#!/bin/bash

source novpn_ns params
echo
echo "-------"
echo

novpn_ns print_params

ip rule del from $SUBNET lookup 100
ip route del default table 100
ip route del $SUBNET dev ${NS}_veth0 table 100

iptables -D FORWARD -s $SUBNET -j ACCEPT
iptables -D FORWARD -d $SUBNET -j ACCEPT
iptables -t nat -D POSTROUTING -j MASQUERADE -s $SUBNET

ip link del ${NS}_veth0
ip netns del $NS
rm -f /run/novpn
