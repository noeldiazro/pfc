#!/bin/bash
BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd
 
echo "Actualizando las listas de paquetes..."
sudo apt-get -qq update

echo "Actualizando los paquetes instalados..."
sudo apt-get -qq upgrade

echo "Instalando screen..."
sudo apt-get -qq -y install screen

echo "Instalando emacs..."
sudo apt-get -qq -y install emacs
ln -s $BASEDIR/config/.emacs ~/.emacs

#echo "Activando interfaz SPI..."
#sudo mv /etc/modules /etc/modules_bk
#sudo ln -s $BASEDIR/config/modules /etc/modules
#sudo mv /etc/modprobe.d/raspi-blacklist.conf /etc/modprobe.d/raspi-blacklist_bk.conf
#sudo ln -s $BASEDIR/config/raspi-blacklist.conf /etc/modprobe.d/raspi-blacklist.conf

#echo "Instalando módulo Python para acceder a la interfaz SPI..."
#sudo apt-get -qq -y install python-dev
#git clone git://github.com/doceme/py-spidev
#sudo python py-spidev/setup.py install

#echo "Instalando Netatalk"
#sudo apt-get -qq -y install netatalk

echo "Instalando Avahi.."
sudo apt-get -qq -y install avahi-daemon
sudo ln -s $BASEDIR$/config/afpd.service /etc/avahi/services/afpd.service

#echo "Instalando Pip..."
#sudo apt-get -qq -y install python-pip

#echo "Instalando Script para administrar la consola serie..."
#sudo wget https://raw.github.com/lurch/rpi-serial-console/master/rpi-serial-console -O /usr/bin/rpi-serial-console
#sudo chmod +x /usr/bin/rpi-serial-console

#echo "Instalando paquete Python: pyserial..."
#sudo pip install pyserial

#echo "Instalando herramientas de programación AVR..."
#sudo apt-get -qq -y install avrdude avrdude-doc binutils-avr avr-libc gcc-avr gdb-avr

#echo "Instalando programador/flash AVR..."
#wget http://project-downloads.drogon.net/gertboard/avrdude_5.10-4_armhf.deb
#sudo dpkg -i avrdude_5.10-4_armhf.deb
#rm avrdude_5.10-4_armhf.deb

echo "Instalando tightvncserver (pide contraseña).."
sudo apt-get install tightvncserver
vncserver :1
mkdir .config/autostart
ln -s $BASEDIR$/config/tightvnc.desktop ~/.config/autostart/tightvnc.desktop
