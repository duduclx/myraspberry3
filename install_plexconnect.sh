#!/bin/bash

#download plexconnect
wget https://github.com/iBaa/PlexConnect/archive/master.zip
unzip -u master.zip

#moving to /opt/PlexConnect
sudo cp -R PlexConnect-master /opt/
sudo mv /opt/PlexConnect-master /opt/PlexConnect

#generating certificat
sudo openssl req -new -nodes -newkey rsa:2048 -out /opt/PlexConnect/assets/certificates/trailers.pem -keyout /opt/PlexConnect/assets/certificates/trailers.key -x509 -days 7300 -subj "/C=US/CN=trailers.apple.com"
sudo openssl x509 -in /opt/PlexConnect/assets/certificates/trailers.pem -outform der -out /opt/PlexConnect/assets/certificates/trailers.cer && cat /opt/PlexConnect/assets/certificates/trailers.key >> /opt/PlexConnect/assets/certificates/trailers.pem

#install startup script
sudo cp plexconnect /etc/init.d/

#make it run at boot
sudo /bin/systemctl daemon-reload
sudo /bin/systemctl enable plexconnect.service
systemctl start plexconnect
