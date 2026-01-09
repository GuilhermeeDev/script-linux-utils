#!/bin/bash
# pasta="$HOME/Downloads-ScriptLinuxUtils"

function proxyfirefox(){
    proxychains firefox
}

function MacAddressChanger(){
    show=$(ip link show eth0 | grep ether | awk '{print $2}')
    echo "Mudando MAC Address..."
    echo "/\ Seu MAC Address atual: $show"
    sudo ip link set eth0 down
    sudo macchanger -A
    sudo ip link set eth0 up
    echo "/\ Seu novo MAC Address: $(ip link show eth0 | grep ether | awk '{print $2}') ///"
}