#!/bin/bash

mkdir -p ~/.vim/colors/
git clone git://github.com/altercation/vim-colors-solarized.git
mv vim-colors-solarized/colors/solarized.vim ~/.vim/colors/
rm -rf vim-colors-solarized
