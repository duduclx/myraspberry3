#!/bin/bash

#remove some unused apps
sudo apt-get remove --purge libreoffice*
sudo apt-get remove --purge claws-mail
sudo apt-get remove --purge minecraft-pi python-minecraftpi
sudo apt-get remove --purge omxplayer penguinspuzzle
sudo apt-get remove --purge scratch sonic-pi wolfram-engine
sudo apt-get remove --purge bluej geany nodered greenfoot
sudo apt-get remove --purge python-sense-emu python3-sense-emu sense-emu-tools
sudo apt-get remove --purge python-pygame
sudo rm -R python_games/
sudo rm -R Documents/BlueJ\ Projects/
sudo rm -R Documents/Greenfoot\ Projects/
sudo rm -R Documents/Scratch\ Projects/
sudo rm -R repo
sudo apt-get autoremove
