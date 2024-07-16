#!/bin/bash

#Discord APT - see github repo: https://github.com/palfrey/discord-apt
touch /etc/apt/sources.list.d/discord.list
echo 'deb https://palfrey.github.io/discord-apt/debian/ ./' >> /etc/apt/sources.list.d/discord.list
wget -O /etc/apt/trusted.gpg.d/discord-apt.gpg.asc  https://palfrey.github.io/discord-apt/discord-apt.gpg.asc
sudo nala update
sudo nala install -y discord

