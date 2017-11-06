#!/bin/sh
sudo chmod u+x ./install_squid.sh
cd ~
echo Y | sudo apt-get install curl
echo Y | sudo apt-get install squid3
echo Y | sudo apt-get install apache2-utils
cd /etc/squid3
sudo apt-get install expect
sudo rm -f squid3.conf
curl -O 'https://raw.githubusercontent.com/myvary/squid3/master/squid.conf'
sudo htpasswd  -c  /etc/squid3/passwd  mc_proxy
expect "New password:"
send "mancao\r"
expect "Re-type new password:"
send "mancao\r"
sudo squid3 -k reconfigur
sudo service squid3 restart
