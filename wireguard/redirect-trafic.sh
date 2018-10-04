#!/bin/bash

WG_INTERFACE=$1
WG_SERVER=$2

GATEWAY_IP=$(/sbin/ip route | awk '/default/ { print $3 }' | head -n 1)
GATEWAY_DEV=$(/sbin/ip route | awk '/default/ { print $5 }' | head -n 1)

WG_IP=$(dig +short $WG_SERVER)

ip route add 0.0.0.0/1 dev $WG_INTERFACE
ip route add 128.0.0.0/1 dev $WG_INTERFACE
ip route add $WG_IP/32 via $GATEWAY_IP dev $GATEWAY_DEV


