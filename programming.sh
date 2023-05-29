#!/bin/bash

# Install pip, aws, sam-cli
sudo apt-get update
 sudo apt  install awscli - y
sudo apt-get install python3-venv -y
sudo apt-get install -y python3.10-dev python3-pip
pip3 install awscli
pip3 install aws-sam-cli


# Install Docker + Docker-compose
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg -y

sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
  
sudo apt install docker-compose -y
  

# Install PostgreSQL
# Добавление репозитория PostgreSQL для Ubuntu
echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" | sudo tee /etc/apt/sources.list.d/pgdg.list
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

# Установка PostgreSQL 15
sudo apt-get update
sudo apt-get install -y postgresql-15

# Инициализация кластера PostgreSQL
sudo pg_createcluster 15 main --start

# Запуск службы PostgreSQL
sudo systemctl start postgresql@15-main.service

# Добавление PostgreSQL в автозапуск
sudo systemctl enable postgresql@15-main.service
