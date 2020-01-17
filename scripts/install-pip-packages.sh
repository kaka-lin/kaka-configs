#!/bin/bash

pip3 install numpy scipy pandas
pip3 install matplotlib seaborn pillow
pip3 install opencv-python scikit-learn

pip3 install jupyter
pip3 install jupyter_contrib_nbextensions
jupyter contrib nbextension install --user
jupyter nbextensions_configurator enable --user
