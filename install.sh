#!/usr/bin/bash

#作業ディレクトリの作成
mkdir mywp
cd mywp

#パッケージの更新
sudo apt-get update
sudo apt install yum

#Dockerの導入と起動
curl -sSL https://get.docker.com/ | CHANNEL=stable sh
sudo service docker start
systemctl enable docker.service

#ユーザー権限の編集
sudo usermod -a -G docker ubuntu

#docker-composeファイルの取得と実行
curl -L https://github.com/docker/compose/releases/download/1.29.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
curl https://raw.githubusercontent.com/KadomiShikaya/wordpress/main/docker-compose.yaml?token=AK7NENJFBZCCGKRVZVNBCGTAPJWPE -o docker-compose.yaml

#dockerコンテナ起動
docker-compose pull
docker-compose up -d
