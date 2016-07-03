#!/bin/bash

#This is a script that adds swap space to a system. This very useful when you
# have a VPS from Digital Ocean and you dont want your low ram servers to crash.


if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi


#Creates the actual Swapfile
sudo fallocate -l 1G /swapfile
#Makes sure it hass the proper sccess permissions
sudo chmod 600 /swapfile
#Make the file into a swapfile
sudo mkswap /swapfile
#Enable the SwapFile
sudo swapon /swapfile
#Make a backup the file so if the next operation goofs you got a backup
sudo cp /etc/fstab /etc/fstab.bak
#Add our swapfile to the list of mounting stuff
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
#Since Swap is slow, make sure not to use it unless we have to
sudo sysctl vm.swappiness=10
#Make sure it does it after reboots
echo "vm.swappiness=10" >> /etc/sysctl.conf
#Turns down caching of whats in our swap because swap is slow
sudo sysctl vm.vfs_cache_pressure=50
echo "vm.vfs_cache_pressure=50" >> /etc/sysctl.conf



