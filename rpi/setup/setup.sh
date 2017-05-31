#!/bin/bash
BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $HOME

echo ">>> Updating package manager repositories... <<<"
sudo apt-get -qq update

echo ">>> Installing screen... <<<"
sudo apt-get -qq -y install screen
ln -s $BASEDIR/config/.screenrc .screenrc
