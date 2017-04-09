#!/bin/bash

# Runs service commands
# First arg is the command, second is the service name (w/o .service)
# $ service start mongodb
function s() {
  sudo systemctl $1 $2.service
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
  find $1 -type d -exec chmod $2 {} \;
  find $1 -type f -exec chmod $3 {} \;
}
