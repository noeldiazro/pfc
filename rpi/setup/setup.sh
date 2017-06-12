#!/bin/bash
BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $HOME

echo ">>> Updating package manager repositories... <<<"
sudo apt-get -qq update

echo ">>> Installing screen... <<<"
sudo apt-get -qq -y install screen
ln -s $BASEDIR/config/.screenrc .screenrc

echo ">>> Installing emacs...<<<"
sudo apt-get -qq -y install emacs
ln -s $BASEDIR/config/.emacs .emacs

echo ">>> Installing netatalk...<<<"
sudo apt-get -qq -y install netatalk

echo ">>> Configuring Python development environment... <<<"
sudo apt-get -qq -y install python-dev
mkdir dev
mkdir .virtualenvs
sudo pip install virtualenvwrapper

echo ">>> Configuring bash... <<<"
cp $BASEDIR/config/.bashrc .bashrc

echo ">>> Enabling SPI... <<<"
sudo cp $BASEDIR/config/config.txt /boot
sudo cp $BASEDIR/config/modules /etc

echo ">>> Installing cyclictest... <<<"
sudo apt-get -qq -y install rt-tests

echo ">>> Reboot is required for changes to take effect. <<<"
