
if [ -d "/opt/homebrew" ]
    fish_add_path "/opt/homebrew/bin"
    export BREW_PREFIX="$(brew --prefix)"
end
  
alias wget="curl -O"

# fixes issue w/ autocompletion on multiuser Homebrew
# happens because zcompinit refuses to run if unsafe dirs are on path but unsafe dirs (group permissions) are a common way to make brew work for multiple users
if [ $BREW_PREFIX ]
    alias zcompinit="zcompinit -u"
end