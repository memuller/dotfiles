#!/bin/bash

# when a command is not found, tries to find an executable with the same name and run it
command_not_found_handle() {
  if cmd.exe /c "(where $1 || (help $1 |findstr /V Try)) >nul 2>nul && ($* || exit 0)"; then
      return $?
  else
      if [ -x /usr/lib/command-not-found ]; then
         /usr/lib/command-not-found -- "$1"
         return $?
      elif [ -x /usr/share/command-not-found/command-not-found ]; then
         /usr/share/command-not-found/command-not-found -- "$1"
         return $?
      else
         printf "%s: command not found\n" "$1" >&2
         return 127
      fi
  fi
}

# does the same, but for ZSH
command_not_found_handler() {
  command_not_found_handle "$@"
  return $?
}

alias appearance='lxappearence'

# X Displays
export LIBGL_ALWAYS_INDIRECT=1
if [ $WSL2 ]; then
  export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0
else
  export DISPLAY=:0
fi

# Connects to host docker instance
export COMPOSE_CONVERT_WINDOWS_PATHS=1
export DOCKER_HOST=tcp://0.0.0.0:2375

# Runs host Vagrant
alias vagrant=vagrant.exe
