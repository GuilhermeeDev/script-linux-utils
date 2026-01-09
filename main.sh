#!/bin/bash
source src/functions.sh

for i in ./src/*.sh; do
    chmod +x "$i"
done

function menu(){
    echo "/////////////////////////////////////////////////"
    echo "///              Kali Linux Utils             ///"
    echo "/////////////////////////////////////////////////"
    echo "/// 1 - Configurar Kali Linux                 ///"
    echo "/// 2 - Mudar MAC Address                     ///"
    echo "/// 3 - Iniciar Firefox com Proxychain        ///"
    echo "/// 0 - Sair                                  ///"
    echo "/////////////////////////////////////////////////"

    read -p "Escolha uma opcao:" choice
    case $choice in
        1) source src/KaliLinuxConfig.sh ;;
        2) MacAddressChanger ;;
        3) proxyfirefox ;;
        0) exit 0 ;;
        *) exit 0 ;;
    esac 
}

menu