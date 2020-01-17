#!/bin/bash

# install powerlevel9k
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

# Download the fonts using wget
wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf

# Copy zshrc to ~/.zshrc
#cp zshrc ~/.zshrc

source ~/.zshrc
