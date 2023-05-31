#!/bin/bash

# Install Telegram-Desktop
sudo apt-get update
sudo apt install telegram-desktop -y

# Install GIT
sudo apt-get update
sudo apt install git -y

# Install Synaptic
sudo apt-get update
sudo apt install synaptic -y

# Install Google-Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt-get update
sudo apt-get upgrade -y
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb

# Install VLC
sudo apt update
sudo apt install vlc

# Battery Saver
sudo apt-get update
sudo apt-get upgrade -y
sudo apt install powertop -y
sudo powertop –calibrate
