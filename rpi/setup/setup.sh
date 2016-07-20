#!/bin/bash
BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $HOME

sudo apt-get update
echo "Installing AppleShare file server (AFP).."
sudo apt-get install netatalk

echo "Installing Avahi.."
sudo apt-get install avahi-daemon

echo "Publishing AFP service"
sudo ln -s $BASEDIR$/config/afpd.service /etc/avahi/services/afpd.service

echo "Configuring Python development environment.."
mkdir .virtualenvs
sudo pip install virtualenvwrapper
ln -s $BASEDIR/config/.profile .profile
. .profile

#echo "Updating package repositories..."
#sudo apt-get -qq update

#echo "Updating installed packages..."
#sudo apt-get -qq upgrade

#echo "Installing screen..."
#sudo apt-get -qq -y install screen
#echo "Downloading screen's config file..."
#wget raw.github.com/startup-class/dotfiles/master/.screenrc -O .screenrc

#echo "Installing emacs..."
sudo apt-get -qq -y install emacs
ln -s $BASEDIR/config/.emacs ~/.emacs

##echo "Activando interfaz SPI..."
sudo cp $BASEDIR/config/config.txt /boot
##sudo mv /etc/modprobe.d/raspi-blacklist.conf /etc/modprobe.d/raspi-blacklist_bk.conf
##sudo ln -s $BASEDIR/config/raspi-blacklist.conf /etc/modprobe.d/raspi-blacklist.conf

##echo "Instalando módulo Python para acceder a la interfaz SPI..."
##sudo apt-get -qq -y install python-dev
##git clone git://github.com/doceme/py-spidev
##sudo python py-spidev/setup.py install

##echo "Instalando Netatalk"
##sudo apt-get -qq -y install netatalk

#echo "Installing Avahi.."
#sudo apt-get -qq -y install avahi-daemon
#sudo ln -s $BASEDIR$/config/afpd.service /etc/avahi/services/afpd.service

##echo "Instalando Pip..."
##sudo apt-get -qq -y install python-pip

##echo "Instalando paquete Python: pyserial..."
##sudo pip install pyserial

##echo "Instalando herramientas de programación AVR..."
##sudo apt-get -qq -y install avrdude avrdude-doc binutils-avr avr-libc gcc-avr gdb-avr

##echo "Instalando programador/flash AVR..."
##wget http://project-downloads.drogon.net/gertboard/avrdude_5.10-4_armhf.deb
##sudo dpkg -i avrdude_5.10-4_armhf.deb
##rm avrdude_5.10-4_armhf.deb

#echo "Installing tightvncserver (asks for password)..."
sudo apt-get -qq -y install tightvncserver
vncserver :1
#mkdir -p .config/autostart
#ln -s $BASEDIR$/config/tightvnc.desktop ~/.config/autostart/tightvnc.desktop
sudo cp $BASEDIR$/config/vncboot /etc/init.d
cd /etc/init.d
sudo update-rc.d vncboot defaults
cd $HOME

#echo "Installing sphinx..."
#sudo apt-get -qq -y install python-sphinx

#echo "Installing graphviz.."
#sudo apt-get -qq -y install graphviz

#echo "Installing Arduino IDE..."
#sudo apt-get -qq -y install arduino

#echo "Installing modified AVR flash loader..."
#wget http://project-downloads.drogon.net/gertboard/avrdude_5.10-4_armhf.deb -O /tmp/avrdude_5.10-4_armhf.deb
#sudo dpkg -i /tmp/avrdude_5.10-4_armhf.deb
#sudo chmod 4755 /usr/bin/avrdude

#echo "Adding Arduino IDE definitions for Gertboard and Raspberry Pi..."
#ARDUINO_CONF_PATH=/usr/share/arduino/hardware/arduino
#cat $BASEDIR/config/gert328_board.txt $ARDUINO_CONF_PATH$/boards.txt > /tmp/boards.txt
#sudo mv $ARDUINO_CONF_PATH$/boards.txt $ARDUINO_CONF_PATH$/boards.txt.bak
#sudo mv /tmp/boards.txt $ARDUINO_CONF_PATH$/
#cat $BASEDIR/config/gpio_programmer.txt $ARDUINO_CONF_PATH$/programmers.txt > /tmp/programmers.txt
#sudo mv $ARDUINO_CONF_PATH$/programmers.txt $ARDUINO_CONF_PATH$/programmers.txt.bak
#sudo mv /tmp/programmers.txt $ARDUINO_CONF_PATH$/

#echo "Downloading script for ATmega328 initialisation..."
#sudo rm -f /usr/local/bin/avrsetup
#sudo wget -q http://project-downloads.drogon.net/gertboard/avrsetup -O /usr/local/bin/avrsetup
#sudo chmod 755 /usr/local/bin/avrsetup

#echo "Downloading script for enabling/disabling serial console..."
#sudo wget https://raw.githubusercontent.com/lurch/rpi-serial-console/master/rpi-serial-console -O /usr/bin/rpi-serial-console
#sudo chmod +x /usr/bin/rpi-serial-console
