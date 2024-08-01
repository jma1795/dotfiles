#!/bin/bash
echo "*****************************************"
echo "* Warthunder's Presenter Install Script *"
echo "*****************************************"

echo "Presenter can be installed without this script. For more details and system requirements please refer to the following URL:"
echo "https://www.worshiptools.com/en-us"
echo "Press CTRL+C anytime to end the script"

#Display System Information
hostnamectl | grep 'Operating System'
lscpu | grep 'Model name'|
echo "Memory:" && free -m | awk '/^Mem:/{printf("%.1fGb\n",$2/1000)}'
echo "GPU:" && lspci | grep VGA

#Set Variables
set -e

export appRoot=~/.local/worshipExtreme
export appImage=$appRoot/Presenter.AppImage
export appDesktopEntry=$appRoot/squashfs-root/we4.desktop
export appIcon=$appRoot/squashfs-root/resources/icon128.png
export osDesktopLinks=~/.local/share/applications
export supportedProcessors=("x86_64")


PS3='What do you want to do?: '
setup=("Unpack Appimage" "Make Executable and move to a Directory" "Download Only")
select fav in "${setup[@]}"; do
    case $fav in
        "Unpack Appimage")
            echo "***Unpacking....***"

#Make directories
mkdir -p $appRoot
mkdir -p $osDesktopLinks
#Installing prerequisits
sudo apt-get update --allow-releaseinfo-change
sudo apt-get -y install libnss3

#Download Worship Extreme
curl -L https://download.worshipextreme.com/download/latest/linux -o $appImage
chmod +x $appImage

#Extract app contents
cd $appRoot
$appImage --appimage-extract

#Modify desktop entry
sed -i '/^Exec=/s/=.*/='${appImage//\//\\/}'/' $appDesktopEntry
sed -i '/^Icon=/s/=.*/='${appIcon//\//\\/}'/' $appDesktopEntry

#Copy desktop entry
cp $appDesktopEntry $osDesktopLinks

cd ~

printf "\n\nPresenter Installation Complete!";

	    break
            ;;
        "Make Executable and move to a Directory")
            echo "***Downloading and moving***"

cd ~/Applications/
curl -L https://download.worshipextreme.com/download/latest/linux -o Presenter.appimage
chmod +x Presenter.appimage

ln -s $HOME/Applications/Presenter.appimage ~/Desktop

printf "\n\nPresenter Installation Complete!";

	    break
            ;;
        "Download Only")
cd ~/Downloads/         
        curl -L https://download.worshipextreme.com/download/latest/linux -o Presenter.appimage
        curl -L https://download.worshiptools.com/chromeos -o install.sh
	    exit
	    ;;
        *) echo "***invalid option $REPLY***";;
    esac



done
