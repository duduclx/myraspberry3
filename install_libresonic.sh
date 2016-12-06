#!/bin/bash

#install required package
sudo apt-get install php5
sudo apt-get install openjdk-8-jre
sudo apt-get install tomcat8 openjdk-8-jdk maven

#configure java environment
#get it from command line
#update-alternatives --list java

export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-armhf/jre/bin/java
#/usr/lib/jvm/jdk-8-oracle-arm32-vfp-hflt/jre/bin/java
export PATH=$JAVA_HOME/bin:$PATH

#echo $PATH
#should return
#/usr/lib/jvm/java-8-openjdk-armhf/jre/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/games:/usr/games

#download libresonic
wget https://github.com/Libresonic/libresonic/releases/download/v6.1/libresonic-v6.1.war

#moving it to tomcat8 and make it run
sudo cp libresonic-v6.1.war /var/lib/tomcat8/webapps
sudo mv /var/lib/tomcat8/webapps/libresonic-v6.1.war /var/lib/tomcat8/webapps/libresonic.war 
sudo mkdir /var/libresonic
sudo chown tomcat8:tomcat8 /var/libresonic/
sudo systemctl restart tomcat8.service

#wait and go to http://localhost:8080/libresonic/
#may take about 15 minutes to run
