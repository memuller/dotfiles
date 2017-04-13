
export ZSH=/home/memuller/.oh-my-zsh

ZSH_THEME="refined"

#ZSH_THEME="bullet-train"
BULLETTRAIN_PROMPT_ORDER=(
  status
  context
  dir
  nvm
  ruby
  git
)
BULLETTRAIN_CONTEXT_DEFAULT_USER="memuller"
BULLETTRAIN_STATUS_EXIT_SHOW=true

DEFAULT_USER=memuller

# ls ~/.oh-my-zsh/plugins to see available plugins
plugins=(git)

# CASE_SENSITIVE="true"

# HYPHEN_INSENSITIVE="true"

DISABLE_AUTO_UPDATE="true"

# export UPDATE_ZSH_DAYS=13

# DISABLE_LS_COLORS="true"

# DISABLE_AUTO_TITLE="true"

# ENABLE_CORRECTION="true"

#COMPLETION_WAITING_DOTS="true"

# DISABLE_UNTRACKED_FILES_DIRTY="true"

# HIST_STAMPS="mm/dd/yyyy"

# ZSH_CUSTOM=/path/to/new-custom-folder
#
source $ZSH/oh-my-zsh.sh

# export LANG=en_US.UTF-8

# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# export ARCHFLAGS="-arch x86_64"
