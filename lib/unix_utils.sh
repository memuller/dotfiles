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
