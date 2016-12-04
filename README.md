# rasppms
plexmedia server and plexconnect on raspberry, with raspbian jessie

this project is about to have
- [plexmedia server](https://www.plex.tv/)
- [PlexConnect](https://github.com/iBaa/PlexConnect/)
- make plexconnect running at boot as a service

# Important

before going to your plexmedia server (http://your-ip:32400/web)
be sure to have reboot after have intalled it !

Then, don't forget to add media to your PlexMedia Server Library.
(see tips)

# How to use:

```
git clone https://github.com/duduclx/myraspberry3.git
cd rasppms
```
First, intall Plexmedia Server:
```
sudo chmod +x install_pms.sh
sudo ./install_pms.sh
```
If you want to install PlexConnect:
```
sudo chmod +x install_plexconnect.sh
sudo ./plexconnect.sh
```

# tips

You can install bonjour (to connect to your raspberry from the finder on your mac)
```
sudo apt-get install avahi-daemon libavahi-client-dev
sudo update-rc.d avahi-daemon defaults
```

Add an USB Hard Drive to your Raspberry
and mount it at boot.

It's can be something like that:
```
sudo mkdir /mnt/library
sudo nano /etc/fstab
```
and add this line (considering your hdd is /dev/sda)
```
/dev/sda1    /mnt/library   vfat   defaults    0    0
```
a command line like
```
df -l
```
can help you to know the name of your hard drive
