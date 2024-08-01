#!/bin/bash

# Update apt
sudo apt install nala -y
sudo nala update

# Multimedia CODECs
sudo nala install mint-meta-codecs -y

# Install Native System Packages
sudo nala install git nfs-common gparted xsensors cheese btop micro flameshot -y

# Install non-repo packages

# Remove Packages I don't use
sudo nala remove -y transmission-gtk hypnotix

# Upgrade What's left
sudo nala upgrade -y

# Autoremove Junk
sudo nala autoremove -y

# Install flatpaks
flatpak install -y flathub com.discordapp.Discord com.google.Chrome com.notesnook.Notesnook

