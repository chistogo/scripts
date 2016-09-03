#!/bin/bash
#The purpose of this script is to update your dynamic DNS from google domains though their web API. 
#This will work inside a NAT network since it uses an external website to get your public IP.
#This works best if you set this in your CRONTAB

#Credentials
username=INSERT_USERNAME_HERE
password=INSERT_PASSWORD_HERE
hostname=subdomain.maindomain.com

#IP outside NAT 
ip="$(wget http://ipinfo.io/ip -qO -)"

#Send that to google
curl https://$username:$password@domains.google.com/nic/update?hostname=$hostname&myip=$ip
