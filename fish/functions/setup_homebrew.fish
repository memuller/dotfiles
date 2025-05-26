
function setup_homebrew
    # user that runs homebrew, if it's a multiuser setup
    set HOMEBREW_USER 'brewer'

    fish_add_path /opt/homebrew/bin
    export BREW_PREFIX="$(brew --prefix)"
    
    # checks if the homebrew runner user exists; if it does, alias brew
    # so that it always runs while impersonating that user
    id -u $HOMEBREW_USER &>/dev/null
    if [ $status = 0 ]
        alias brew="sudo -Hu $HOMEBREW_USER brew"
    end
    
    # fixes issue w/ autocompletion on multiuser Homebrew
    # happens because zcompinit refuses to run if unsafe dirs are on path but unsafe dirs (group permissions) are a common way to make brew work for multiple users
    alias zcompinit="zcompinit -u"

end
  
