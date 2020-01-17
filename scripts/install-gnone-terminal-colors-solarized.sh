#!/bin/bash                                                                                                                                                                        
 
# URL: https://github.com/aruhier/gnome-terminal-colors-solarized
sudo apt-get install dconf-cli
 
git clone https://github.com/aruhier/gnome-terminal-colors-solarized.git
./gnome-terminal-colors-solarized/set_dark.sh
 
sudo rm -rf gnome-terminal-colors-solarize
