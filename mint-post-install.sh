#!/bin/bash

# Update apt
sudo apt install nala -y
sudo nala update

# Multimedia CODECs
sudo nala install mint-meta-codecs -y

# Install Native System Packages
sudo nala install git nfs-common gparted xsensors cheese btop micro -y

# Install non-repo packages

# Great Purge

# Upgrade Packages
sudo nala upgrade -y

# Autoremove
sudo nala autoremove -y

# Install flatpaks
flatpak install -y flathub com.discordapp.Discord com.google.Chrome com.notesnook.Notesnook

