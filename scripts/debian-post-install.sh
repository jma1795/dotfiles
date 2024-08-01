#!/bin/bash

# Update apt
sudo apt install nala -y
sudo nala update

# Multimedia CODECs
sudo nala install libavcodec-extra -y

# Install Native System Packages
sudo nala install git nfs-common gparted xsensors guvcview btop gimp inkscape -y

# Install non-repo packages

# Great Purge

# Upgrade Packages
sudo nala upgrade -y

# Autoremove
sudo nala autoremove -y

# Install flatpaks

sudo nala install -y flatpak plasma-discover-backend-flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo


flatpak install -y flathub com.google.Chrome com.discordapp.Discord com.sindresorhus.Caprine com.notesnook.Notesnook com.vivaldi.Vivaldi org.mozilla.Thunderbird

