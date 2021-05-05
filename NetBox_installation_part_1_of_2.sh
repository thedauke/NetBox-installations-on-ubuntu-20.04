#!/usr/bin/env bash
#Tutorial to install docker with netbox on Ubuntu 20.04 by tdads

sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install git curl python3-pip -y
sudo pip3 install docker-compose
sudo snap install docker

       #if pip doesn't works
      
# DESTINATION=/usr/local/bin/docker-compose
# sudo curl -L https://github.com/docker/compose/releases/download/1.29.1/# docker-compose-$(uname -s)-$(uname -m) -o $DESTINATION
# sudo chmod 755 $DESTINATION
      
   
mkdir -p ~/NetBox && cd ~/NetBox
git clone -b release https://github.com/netbox-community/netbox-docker.git netbox-docker
cd netbox-docker 

tee docker-compose.override.yml <<EOF
version: '3.4'
services:
  netbox:
    ports:
      - 8000:8080
EOF

sudo docker-compose pull
sudo docker-compose up -d
sudo docker-compose stop
service docker stop
sudo docker-compose up -d

#TEST
# sudo IMAGE=netboxcommunity/netbox:latest ./test.sh