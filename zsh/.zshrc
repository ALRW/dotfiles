# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

declare -a dirs_to_prepend
dirs_to_prepend=(
  "/usr/local/sbin"
  "/usr/local/git/bin"
  "/usr/local"
  "/usr/local/mysql/bin"
  "/sw/bin"
  "/usr/local/bin"
  "$HOME/.cargo/bin"
  "$HOME/bin"
  "$HOME/.rvm/bin"
  "$HOME/.yarn/bin"
  "$HOME/.nodenv/versions/10.16.0/lib/node_modules/"
)

# Explicitly configured $PATH
export PATH="/usr/bin:/bin:/usr/sbin:/sbin"

for dir in ${(k)dirs_to_prepend[@]}; do
  # If these directories exist, then prepend them to existing PATH
  [ -d ${dir} ] && PATH="${dir}:$PATH"
done

# ZSH theme
ZSH_THEME="wezm"

# Set default editor to Vim
export EDITOR="vim"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=7

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd.mm.yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)

# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  common-aliases
  git-extras
  history
  jsontools
  z
  zsh-syntax-highlighting
)

# oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# add in a number of personal shell functions
[ -f $HOME/.shell_functions.zsh ] && source $HOME/.shell_functions.zsh
[ -f $HOME/.alias ] && source $HOME/.alias
[ -f ~/.fzf.zsh ] && source $HOME/.fzf.zsh

# defaults fzf command utilises an ignore file to reduce search area
export FZF_DEFAULT_COMMAND='ag --path-to-ignore ~/.ignore --hidden -g ""'

# NVM setup
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

# Space for any company/machine specific setup
[ -f $HOME/.local_config.zsh ] && source $HOME/.local_config.zsh
# Space for any company/machine specific env vars
[ -f $HOME/.local_vars ] && source $HOME/.local_vars
