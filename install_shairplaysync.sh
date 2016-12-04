#!/bin/bash

#install dependencies
sudo apt-get install autoconf libtool libdaemon-dev libasound2-dev libpopt-dev libconfig-dev
sudo apt-get install avahi-daemon libavahi-client-dev
sudo apt-get install libssl-dev

#geting shairport sources
git clone https://github.com/mikebrady/shairport-sync.git

#making with systemd
cd shairport-sync
autoreconf -i -f
./configure --with-alsa --with-avahi --with-ssl=openssl --with-systemd
make

#creating specific user
getent group shairport-sync &>/dev/null || sudo groupadd -r shairport-sync >/dev/null
getent passwd shairport-sync &> /dev/null || sudo useradd -r -M -g shairport-sync -s /usr/bin/nologin -G audio shairport-sync >/dev/null

#installing
sudo make install

# ask for airplay name
echo "Please type the name for airplay"
echo "something like Kitchen, room, ..."
echo "======================="
read -p " type here " AIRPLAY

#running it for first time
start-stop-daemon --start --quiet --pidfile $PIDFILE --exec $DAEMON -- -d -a "$AIRPLAY" -- -d hw:0 -t hardware -c "PCM" || return 2
