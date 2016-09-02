#!/bin/bash


#Credentials
username=INSERT_USERNAME_HERE
password=INSERT_PASSWORD_HERE
hostname=subdomain.maindomain.com

#IP outside NAT 
ip="$(wget http://ipinfo.io/ip -qO -)"

#Send that to google
curl https://$username:$password@domains.google.com/nic/update?hostname=$hostname&myip=$ip
