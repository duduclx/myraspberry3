#!/bin/bash

#install tightvncserver
sudo apt-get install tightvncserver

#make it run at boot
sudo cp vncserver /etc/init.d/
sudo chmod +x /etc/init.d/vncserver
sudo update-rc.d vncserver defaults
sudo update-rc.d vncserver enable

#run vnc
sudo service vncserver start
