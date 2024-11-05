#!/bin/bash

source novpn_ns params -f
novpn_ns print_params

echo "Enabling IP forwarding"
sysctl -w net.ipv4.ip_forward=1

echo "Adding network namespace"
ip netns add $NS

echo "Adding _veth0 and _veth1 pair"
ip link add ${NS}_veth0 type veth peer name ${NS}_veth1

echo "Moving _veth1 to netns"
ip link set ${NS}_veth1 netns ${NS}

echo "Setting IP adresses for veth pair"
ip addr add $VETH0_ADDRNET dev ${NS}_veth0
ip netns exec ${NS} ip addr add $VETH1_ADDRNET dev ${NS}_veth1

echo "Bringing devices up"
ip link set ${NS}_veth0 up
ip netns exec ${NS} ip link set ${NS}_veth1 up
ip netns exec ${NS} ip link set lo up

echo "Adding routes"
ip netns exec ${NS} ip route add default via $VETH0_ADDR dev ${NS}_veth1

echo "Adding routing table 100"
ip rule add from $SUBNET lookup 100
ip route add default via $GATEWAY dev $DEV table 100
ip route add $SUBNET dev ${NS}_veth0 table 100

echo "Editing iptables rules"
iptables -A FORWARD -s $SUBNET -j ACCEPT
iptables -A FORWARD -d $SUBNET -j ACCEPT
iptables -t nat -A POSTROUTING -j MASQUERADE -s $SUBNET

echo "Done"
