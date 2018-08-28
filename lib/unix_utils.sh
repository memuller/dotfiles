#!/bin/sh

# Runs service commands
# First arg is the command, second is the service name (w/o .service)
# command may be e,d,s,p,r,l,t (enable,disable,start,stop,restart,reload,status)
# if service is ommited or 'last' or 'l', will reuse service in previous call
# $ s start mongodb
# $ s restart
# $ s t
function s() {
  if [ $# -lt 2 ] || [ $2 = "l" ] || [ $2 = "last" ] ; then
      srvc=$LAST_SERVICE
  else
    srvc=$2
  fi
  export LAST_SERVICE=$srvc

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
  sudo systemctl $cmd $srvc.service
}

# Removes spaces on given input
# $ echo "    those spaces will be gone  " | trim
function trim() {
  sed "s/[[:space:]]//g"
}

# Removes comments on given input
# $ echo "/* will echo nothing */"
function stripComments() {
  sed -e 's/^\/\*![0-9]\{5\}.*\/;$//g'
}

# Sets permissions, recursively, on a given path.
# first arg is path, second arg is the permission set for folders,
# third arg is the permission set for files.
# $ perms . 755 644
function perms(){
  if [ ! $# -eq 3 ]; then
    echo "Call with three parameters (path, folderPermission, filePermissions)"
    return 1
  fi
  find $1 -type d -exec chmod $2 {} \;
  find $1 -type f -exec chmod $3 {} \;
}

# Lists directories.
function dirs() {
  array= ls -l | egrep '^d' | awk '{print $9}'
  return array
}

# Removes CR (Windows line endings).
function fixEndings() {
  awk 'BEGIN{RS="^$";ORS="";getline;gsub("\r","");print>ARGV[1]}' $1
}

# Fetches gitignore file samples from gitignore.io
function gitignore() {
  URL="https://www.gitignore.io/api/$1"
  curl $URL >> .gitignore
}
