#!/bin/bash

#remove some unused apps
sudo apt-get remove --purge libreoffice*
sudo apt-get remove omxplayer minecraft-pi scratch sonic-pi wolfram-engine
sudo apt-get autoremove
