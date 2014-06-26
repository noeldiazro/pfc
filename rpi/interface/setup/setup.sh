#!/bin/bash
BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd
 
echo "Activando interfaz SPI..."
sudo mv /etc/modules /etc/modules_bk
sudo ln -s $BASEDIR/config/modules /etc/modules
sudo mv /etc/modprobe.d/raspi-blacklist.conf /etc/modprobe.d/raspi-blacklist_bk.conf
sudo ln -s $BASEDIR/config/raspi-blacklist.conf /etc/modprobe.d/raspi-blacklist.conf

echo "Instalando módulo Python para acceder a la interfaz SPI..."
sudo apt-get -qq update
sudo apt-get -qq -y install python-dev
sudo python $BASEDIR/py-spidev/setup.py install
