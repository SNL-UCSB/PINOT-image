#!/bin/sh

ethaddr=$(ifconfig | grep -A 1 "eth0" | grep "inet " | awk '{print $2}')
ethgateway=$(netstat -rn | grep "eth0" | grep "UG " | awk '{print $2}')
wlanaddr=$(ifconfig | grep -A 1 "wlan0" | grep "inet " | awk '{print $2}')
wlangateway=$(netstat -rn | grep "wlan0" | grep "UG " | awk '{print $2}')
ip route del default table 100 || true
ip route del default table 200 || true
ip rule del lookup 100 || true
ip rule del lookup 200 || true

echo $ethaddr
echo $ethgateway
echo $wlanaddr
echo $wlangateway

ip route add default via $ethgateway table 100 || true
ip route add default via $wlangateway table 200 || true
ip rule add from $ethaddr lookup 100 || true
ip rule add from $wlanaddr lookup 200 || true