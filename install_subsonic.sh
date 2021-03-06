#!/bin/bash

# see
#oraclejava8.txt
#or make it as a script and run it

wget http://subsonic.org/download/subsonic-6.0.deb
sudo dpkg -i subsonic-6.O.deb

echo "go to http://onlinemd5.com/"
echo "scroll down to"
echo "MD5 & SHA1 Hash Generator For Text"
echo "and type your confirmation email"
echo "then copy paste the md5hash as licence for your email"
echo "on your subsonic web interface"
echo "on localhost:4040"
echo "change your /etc/hosts file"
echo "enter on your terminal"
echo "sudo nano /etc/hosts"
echo "then change line"
echo "127.0.0.1 localhost"
echo "to"
echo "127.0.0.1 localhost subsonic.org"
echo "cheers"


## add jukebox player mode
aplay -L
# or
cat /proc/asound/cards
# then edit the subsonic start script:
sudo nano /usr/bin/subsonic
# add this just before  the -verbose:gc \
'-Djavax.sound.sampled.SourceDataLine=#PCH [plughw:1,0]' \

# then restart subsonic and wait one minute
sudo service subsonic restart
