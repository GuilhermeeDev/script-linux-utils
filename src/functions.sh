#!/bin/bash
pasta="$HOME/Downloads-ScriptLinuxUtils"

function proxyfirefox(){
    proxychain firefox
}

function MacAddressChanger(){
    show=$(ip link show eth0 | grep ether | awk '{print $2}')
    echo "Mudando MAC Address..."
    echo "/// Seu MAC Address atual: $show///"
    echo .
    echo .
    sudo ip link set eth0 down
    sudo macchanger -A
    sudo ip link set eth0 up
    echo .
    echo .
    echo "/// Seu novo MAC Address: $(ip link show eth0 | grep ether | awk '{print $2}') ///"
}