#!/bin/bash

packages=( tor cargo htop python3 pip macchanger plocate fastfetch fzf vim silversearcher )

sudo apt update -y && sudo apt upgrade -y
sudo apt-get full-upgrade -y

sudo apt-get autoclean -y

rm /etc/proxychains4.conf
touch /etc/proxychains4.conf

# Funcao de configuracao do proxychains para o funcionamento do Tor Browser
# Evita que o seu IP real seja vazado e caia na lista negra de IPs
# CONFIGURACAO PADRAO, MAS NAO RECOMENDADA, EM CASO DE USO DE VPN
{
    echo "dynamic_chain"
    echo "proxy_dns"
    echo "remote_dns_subnet 224"
    echo "tcp_read_time_out 15000"
    echo "tcp_connect_time_out 8000"
    echo "[ProxyList]"
    echo "socks4 127.0.0.1:9050"
    echo "socks5 127.0.0.1:9050"

} > /etc/proxychains4.conf

sudo apt install -y "${packages[@]}"

# Configuracao do Tor
echo 'GRUB_DISABLE_RECOVERY="true"' >> /etc/default/grub

# Habilitando o tor para inicio automatico com o sistema
sudo service tor start
sudo systemctl enable tor

# Instalando e habilitando o Atuin
cargo install atuin
echo 'eval "$(atuin init bash)"' >> ~/.bashrc
