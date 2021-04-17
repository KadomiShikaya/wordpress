#!/usr/bin/bash

mkdir mywp
cd mywp

sudo apt-get update
sudo apt install yum

curl -sSL https://get.docker.com/ | CHANNEL=stable sh

sudo service docker start

systemctl enable docker.service

sudo usermod -a -G docker ubuntu

curl -L https://github.com/docker/compose/releases/download/1.29.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

curl https://raw.githubusercontent.com/KadomiShikaya/wordpress/main/docker-compose.yaml?token=AK7NENJFBZCCGKRVZVNBCGTAPJWPE -o docker-compose.yaml

docker-compose pull
docker-compose up -d
