#!/bin/sh
sudo chmod u+x ./install_squid.sh
cd ~
echo Y | sudo apt-get install curl
echo Y | sudo apt-get install squid3
echo Y | sudo apt-get install apache2-utils
cd /etc/squid
sudo rm -f squid.conf
sudo curl -O 'https://raw.githubusercontent.com/myvary/squid3/master/squid.conf'
sudo htpasswd  -c  /etc/squid/passwd  mc_proxy
sudo squid -k reconfigur
sudo service squid restart
