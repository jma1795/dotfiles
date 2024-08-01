#!/bin/bash

# Update apt
sudo dnf update -y

# Multimedia CODECs
sudo dnf group install Multimedia -y

#Enabling the RPM Fusion repositories
#Free repository
sudo dnf install \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
#Nonfree repository
sudo dnf install \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm


# Install Native System Packages
sudo dnf install git gparted xsensors guvcview bpytop thunderbird -y

# Install non-repo packages
wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
sudo sudo dnf localinstall  -y ./google-chrome-stable_current_x86_64.rpm
rm google-chrome-stable_current_x86_64.rpm
# Great Purge


#Enable Flathub
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
# Install flatpaks
flatpak install -y flathub com.discordapp.Discord com.notesnook.Notesnook

