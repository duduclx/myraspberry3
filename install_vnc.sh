#!/bin/bash

#via web and java applet
#go to ip:5800

#install tightvncserver
sudo apt-get install tightvncserver

#make it run at boot
sudo cp vncserver /etc/init.d/
sudo chmod +x /etc/init.d/vncserver
sudo update-rc.d vncserver defaults
sudo update-rc.d vncserver enable

#run vnc
sudo service vncserver start

#### other method, not tested
#enable service
#sudo update-rc.d vncserver-x11-serviced defaults
#sudo update-rc.d vncserver-x11-serviced enable

#install
#sudo apt-get install x11vnc

#get ip
#hostname -I >> ip.txt
#IP="$( cat ip.txt)"

#make it listen forever
#su - pi -c '/usr/bin/x11vnc -display :0 -noxdamage -shared -usepw -listen -forever $IP' 
