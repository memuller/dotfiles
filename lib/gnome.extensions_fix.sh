#!/bin/bash

# waits.
sleep 5

# remedies double-icon for pomodoro extension
gnome-shell-extension-tool -e 'pomodoro@arun.codito.in'
gnome-shell-extension-tool -d 'pomodoro@arun.codito.in'

# fixes wrong window icons in the global bar
gnome-shell-extension-tool -r 'pixel-saver@deadalnix.me'