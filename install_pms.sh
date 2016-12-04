#!/bin/bash

#install dependencies
sudo apt-get update
sudo apt-get install apt-transport-https

#get gpg key
wget -O - https://dev2day.de/pms/dev2day-pms.gpg.key  | sudo apt-key add -  
#add source
echo "deb https://dev2day.de/pms/ jessie main" | sudo tee /etc/apt/sources.list.d/pms.list 

#install pms
sudo apt-get update 
sudo apt-get install -t jessie plexmediaserver
