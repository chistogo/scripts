#!/usr/bin/env bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

clear

echo "Setting UP SSHSF"
echo -n "Enter the IP of server and press [ENTER]: "
read ip

echo -n "Enter the Username of server and press [ENTER]: "
read uname

echo -n "Enter Password of server and press [ENTER]: "
read -s password

sudo apt-get install sshfs
sudo mkdir /mnt/fileshare
echo $password | sudo sshfs -o password_stdin,allow_other $uname@$ip:/ /mnt/fileshare


sudo sed -i -e "\$i \echo $password | sudo sshfs -o password_stdin,allow_other $uname@$ip:/ /mnt/fileshare &\n" /etc/rc.local

echo "Shared Folder is in/mnt/fileshare"
echo "Edited rc.local to mount at boot"



