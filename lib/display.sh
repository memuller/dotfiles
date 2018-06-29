#!/bin/bash
#xrandr --query | grep '\bconnected\b' | grep 'DVI-I'
if [ -f $HOME/.screenlayout/default.sh ]; then
	source $HOME/.screenlayout/default.sh
fi
