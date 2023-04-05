#!/usr/bin/env bash

dir="$HOME/.config/rofi/launchers/"

## Run
rofi \
	-show $1 \
    -theme ${dir}/launcher.rasi

## Usage: 
# $HOME/.config/rofi/launchers/launcher.sh drun
# $HOME/.config/rofi/launchers/launcher.sh run
# $HOME/.config/rofi/launchers/launcher.sh filebrowser
# $HOME/.config/rofi/launchers/launcher.sh window
