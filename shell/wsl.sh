#!/bin/bash

#when a command is not found, tries to find an executable with the same name and run it
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

# Window/tab title
function precmd() {
  window_title="\\033]0;${PWD##*/}\\007"
  echo -ne "$window_title"
}

# X Displays
export LIBGL_ALWAYS_INDIRECT=1
if [ $WSL2 ]; then
  export WINHOST=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}')
  export DISPLAY="$WINHOST:0"
else
  export DISPLAY=:0
fi

# Connects to host docker instance
export COMPOSE_CONVERT_WINDOWS_PATHS=1

# Runs host Vagrant
alias vagrant=vagrant.exe
alias mysqlc="mysql -uroot -p1234 -h$WINHOST"

# Starts cron
sudo /etc/init.d/cron start > /dev/null
# root crontab * * * * * echo 3 > /proc/sys/vm/drop_caches; touch /root/drop_caches_last_run
# visudo %sudo ALL=NOPASSWD: /etc/init.d/cron start