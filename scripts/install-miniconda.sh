#!/bin/bash

# Download installer
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
# Change the access permissions of files
chmod +x Miniconda3-latest-Linux-x86_64.sh

mkdir -p ~/opt
bash Miniconda3-latest-Linux-x86_64.sh

# Copy conda initialize in ~/.bash_profile or ~/.bashrc to ~/.zshrc
# Then 
#Source ~/.zshrc
