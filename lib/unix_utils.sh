#!/bin/bash

# Runs service commands
# First arg is the command, second is the service name (w/o .service)
# $ service start mongodb
function s() {
  case $1 in
    e)
      cmd="enable";;
    d)
      cmd="disable";;
    s)
      cmd="start";;
    p)
      cmd="stop";;
    r)
      cmd="restart";;
    l)
      cmd="reload";;
    t)
      cmd="status";;
    *)
      cmd=$1
  esac
  sudo systemctl $cmd $2.service
}

# Removes spaces on given input
# $ echo "    those spaces will be gone  " | trim
function trim() {
  sed "s/[[:space:]]//g"
}

# Sets permissions, recursively, on a given path.
# first arg is path, second arg is the permission set for folders,
# third arg is the permission set for files.
# $ perms . 755 644
function perms(){
  if [[ ! $# -eq 3 ]]; then
    echo "Call with three parameters (path, folderPermission, filePermissions)"
    return 1
  fi
  find $1 -type d -exec chmod $2 {} \;
  find $1 -type f -exec chmod $3 {} \;
}
