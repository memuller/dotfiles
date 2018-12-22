#!/bin/bash

# pipes sound line input to output w/ gstreamer/pulse
alias old_listen='gst-launch-1.0 pulsesrc ! pulsesink'

# gets distro name
alias distro="lsb_release -i | sed 's/Distributor ID://' | sed 's/[[:space:]]//g'"

# loads audio loopback pulseaudio module
function listen {
  if [ $listening ]; then
    pactl unload-module module-loopback
    export listening=0
  else
    pactl load-module module-loopback
    export listening=1
  fi
}

