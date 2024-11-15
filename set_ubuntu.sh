\#!/bin/bash
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
printf "Ubuntu Setup Script\n"
printf "Custom script by Y.U.P. to easily set up the machine\n"
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -


if nc -zw1 google.com 443 > /dev/null 2>&1; then
    printf "\nConnected to the internet\n\n"
else 
    printf "Internet connection is required\n\n"
    exit 0
fi    


printf "Setup types:\n"
printf "0 = Do Nothing (Exit)\n"
printf "1 = Only update packages\n"
printf "2 = Basic desktop setup\n"
printf "3 = Basic engineering setup\n"
printf "4 = Full engineering setup\n"
printf "Enter setup type: "

read setup

if [ $setup -gt 4 ] || [ $setup -le 0 ]; then
    printf "Invalid input\n"
    exit 0
fi


if [ $setup -gt 0 ]; then
    printf "\n> Updating package lists\n"
    sudo apt update

    if [ $setup -gt 1 ]; then 
    printf "> Setting local time as RTC ...\n"
    timedatectl set-local-rtc true

    printf "\n> Removing Firefox ...\n"
    sudo snap remove firefox*

    printf "> Removing Firebird ...\n"
    sudo apt remove -y firebird*

    printf "> Installing Geary email client ...\n"
    sudo apt install -y geary

    printf "> Installing CopyQ ...\n"
    sudo apt install -y copyq

    printf "> Installing file-roller (preview zips) ...\n"
    sudo apt install -y file-roller

    printf "> Installing gnome-sushi (file preview) ...\n"
    sudo apt install -y gnome-sushi

    printf "> Installing gnome-calendar ...\n"
    sudo apt install -y gnome-calendar

    printf "> Installing dej-dup, backup application ...\n"
    sudo apt install -y deja-dup
    
    printf "> Installing gnome-tweaks ...\n"
    sudo apt install -y gnome-tweaks

    printf "> Installing gnome-extension manager and some extenstions ...\n"
    sudo apt install -y gnome-shell-extension-manager
    sudo apt install -y gnome-shell-extensions
    printf ">> Make sure to configure those extensions according to the need"

    printf "> Installing VLC media player ...\n"
    sudo apt install -y vlc

    printf "> Installing Rhythmbox ...\n"
    sudo apt install -y rhythmbox

    printf "> Installing pinta ...\n"
    sudo snap install pinta

    printf "> Installing aisleriot ...\n"
    sudo apt install -y aisleriot

    printf "> Installing tessaract ocr ...\n"
    sudo apt install -y tesseract-ocr

    fi
    
    if [ $setup -gt 2 ]; then

    printf "> Intstalling ssh ...\n"
    sudo apt install -y ssh

    printf "> Installing VS Code snap ...\n"
    sudo snap install --classic code
    
    printf "> Installing libreoffice ...\n"
    sudo apt install -y libreoffice

    printf "> Removing default calculator ...\n"
    sudo apt remove -y gnome-calculator

    printf "> Installing Qalculate ...\n"
    sudo apt install -y qalculate-gtk
    gsettings set org.gnome.settings-daemon.plugins.media-keys calculator-static "['']"
    
    printf "\n\n Remember to bind this key to Qalculate with GUI \n\n"
    # gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ name 'qalc'

    # gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ command 'qalculate'

    # gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ binding '<Calculator>'

    printf "> Installing xcircuit ...\n"
    sudo apt install -y xcircuit
    
    printf "> Installing geogebra ...\n"
    sudo apt install -y geogebra
    
    printf "> Installing Calibre ...\n"
    sudo apt install -y calibre

    printf "> Installing KiCad ...\n"
    sudo apt install -y kicad

    printf ">> Update /etc/systemd/logind.conf to ignore lid status"
    
    fi
	
    if [ $setup -gt 3 ]; then
    
    printf "> Installing Octave ...\n"
    sudo apt install -y octave

    printf "> Installing texlive ...\n"
    sudo apt install -y texlive*

    fi

    printf "\n> Upgrading all packages ...\n"
    sudo apt upgrade -y

    printf "\n> Upgrading all snaps ...\n"
    sudo snap refresh

fi
