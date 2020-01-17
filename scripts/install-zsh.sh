#!/bin/bash

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y zsh 
sudo apt-get install -y git wget

# oh-my-szh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
# default set to zsh
chsh -s /bin/zsh

# Need to restart the computer
#sudo reboot now
