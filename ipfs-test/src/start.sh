#!/bin/bash
sleep 3
ip link set eth1 up
ip link set eth0 down
ip addr add $MY_IP/24 dev eth1
ip route del default
ip route add 192.168.0.0/16 via $GATEWAY_IP dev eth1
ip route add 10.0.10.0/24 via $GATEWAY_IP dev eth1
ip route add default via $GATEWAY_IP

ipfs init
ipfs config --json Addresses.Swarm '["/ip4/0.0.0.0/tcp/4001", "/ip4/0.0.0.0/udp/4001/quic-v1", "/ip4/0.0.0.0/udp/4001/quic-v1/webtransport"]'
ipfs config --json Addresses.API '"/ip4/127.0.0.1/tcp/5001"'
ipfs config --json Addresses.Gateway '"/ip4/127.0.0.1/tcp/8080"'
ipfs bootstrap rm --all
exec ipfs daemon
sleep infinity
