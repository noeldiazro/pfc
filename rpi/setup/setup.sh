#!/bin/bash
echo "Actualizando las listas de paquetes..."
sudo apt-get -qq update

echo "Actualizando los paquetes instalados..."
sudo apt-get -qq upgrade

echo "Instalando emacs..."
sudo apt-get -qq -y install emacs
ln - s config/.emacs ~/.emacs

echo "Instalando Netatalk"
sudo apt-get -qq -y install netatalk

echo "Instalando Avahi.."
sudo apt-get -qq -y install avahi-daemon
sudo ln -s /home/pi/pfc/rpi/setup/config/afpd.service /etc/avahi/services/afpd.service

echo "Instalando Pip..."
sudo apt-get -qq -y install python-pip

echo "Instalando Script para administrar la consola serie..."
sudo wget https://raw.github.com/lurch/rpi-serial-console/master/rpi-serial-console -O /usr/bin/rpi-serial-console
sudo chmod +x /usr/bin/rpi-serial-console

echo "Instalando paquete Python: pyserial..."
sudo pip install pyserial

echo "Instalando herramientas de programación AVR..."
sudo apt-get -qq -y install avrdude avrdude-doc binutils-avr avr-libc gcc-avr gdb-avr

echo "Instalando programador/flash AVR..."
wget http://project-downloads.drogon.net/gertboard/avrdude_5.10-4_armhf.deb
sudo dpkg -i avrdude_5.10-4_armhf.deb
rm avrdude_5.10-4_armhf.deb
