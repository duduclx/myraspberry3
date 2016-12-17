#!/bin/bash

# install all from repo
sudo apt-get update & upgrade

## manual installation
# install mysql
sudo apt-get install -y mysql-server mysql-client

# install apache and php5
sudo apt-get install apache2 php5 php5-common php5-gd php5-mysql
sudo apt-get install php5-sqlite curl libcurl3 libcurl3-dev php5-curl

# get owncloud
wget https://download.owncloud.org/community/owncloud-9.1.3.zip
unzip owncloud-9.1.3.zip
rm owncloud-9.1.3.zip

# moving files
sudo mv owncloud/ /var/www/
sudo cp owncloud.conf /etc/apache2/sites-available/owncloud.conf

# setting up owncloud server
sudo chown www-data:www-data -R /var/www/owncloud/
sudo chmod 770 -R /var/www/owncloud/

sudo a2enmod rewrite
sudo a2enmod headers
sudo a2enmod env
sudo a2enmod dir
sudo a2enmod mime

# setting mysql database
# ask for user and password for editing local-settings.py
#echo "Please type your mysql password for root user"
#echo "something like Mys3cr3t"
#echo "======================="
#read -p " type here " MYSQL

# create user and database for graphite
#mysql -u root -p$MYSQL << EOF
#create database owncloud;
#create user 'owncloud'@'localhost' identified by 'owncloud_password';
#grant all on owncloud.* to 'owncloud';
#EOF

# starting owncloud
sudo a2ensite owncloud
sudo service apache2 restart

# go to web initialisation
echo "well done !"
echo "go to http://localhost/owncloud"
echo "and start your cloud!"

#chmod u+x oc_perms.sh
#sudo ./oc_perms.sh
