#!/bin/bash

#Script that runs arp-scan with the correct paramters to scan LAN for IPs 

#Q: But chris why are you committing such trival non sense to github?
#A: Because I always end up googling the proper syntax for this command

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

sudo apt-get install arp-scan -y

echo "Please enter a network Interface: "
read interface
sudo arp-scan --interface=$interface --localnet