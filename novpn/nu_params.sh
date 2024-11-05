#!/bin/bash

# Ensure that /run/novpn exists
if [ !  -e /run/novpn ]; then
    if [[ " $* " == *" -f "* ]]; then
        echo "/run/novpn does not exist."
        if [ ! -e /etc/novpn ]; then
            echo "/etc/novpn does not exist."
            novpn_ns_configure_default
        fi
        cp /etc/novpn /run/novpn
        chmod 644 /run/novpn
    else
        echo "'novpn_ns' seem to be not up." >&2
        echo "    Use: 'sudo systemctl start novpn' to bring it up, or" >&2
        echo "    Use: 'sudo novpn_ns up'" >&2
        echo "    Use: 'cp /etc/novpn /run/novpn' to manually mark it as up" >&2
        exit 1
    fi
fi

export NS=$(cat /run/novpn | grep NS | awk '{print $2}')
export DEV=$(cat /run/novpn | grep DEV | awk '{print $2}')
export GATEWAY=$(cat /run/novpn | grep GATEWAY | awk '{print $2}')
export SUBNET=$(cat /run/novpn | grep SUBNET | awk '{print $2}')

export VETH0_ADDR=$(novpn_ns ip_offset $SUBNET 0.0.0.1)
export VETH1_ADDR=$(novpn_ns ip_offset $SUBNET 0.0.0.2)
export VETH0_ADDRNET=$VETH0_ADDR/30
export VETH1_ADDRNET=$VETH1_ADDR/30

