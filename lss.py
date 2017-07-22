#!/usr/bin/env python3

# Get-ChildItem/dir/ls is horrible in powershell,  here is a quick and dirty script to list files in a more sane way
# Best used if you create an function and put it in your profile
# Ex:
# notepad.exe $profile
# add the following line
# function lss {python c:\scripts\lss.py}

import os
import subprocess

# if you notice any delay, its from this line of code
height = int(subprocess.check_output("powershell.exe -NoProfile (get-host).UI.RawUI.WindowSize.Height", stderr=subprocess.STDOUT, shell=True)[:-2])
#width = int(subprocess.check_output("powershell.exe -NoProfile (get-host).UI.RawUI.WindowSize.Width", stderr=subprocess.STDOUT, shell=True)[:-2])

files = os.listdir("./")

os.system("clear")

i = 0
while i<len(files):
    print(files[i])
    if((i+1)%(height-1)==0 and i!=0):
        if(input("-- More --") == 'b'):
            i-=((height-1)*2)
            if(i<0):
                i=0
                os.system("clear")
                continue
        os.system("clear")
    i += 1
