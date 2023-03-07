export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="/Users/fredboivin/.oh-my-zsh"

# ZSH_THEME="robbyrussell"

# __git_files () {
#     _wanted files expl 'local files' _files
# }

plugins=(git)

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

source "${ZINIT_HOME}/zinit.zsh"

# zinit light romkatv/powerlevel10k
# zinit snippet https://github.com/sainnhe/dotfiles/raw/master/.zsh-theme/everforest-dark.zsh

source $ZSH/oh-my-zsh.sh

autoload -Uz compinit
compinit

function insert-selecta-path-in-command-line() {
  local selected_path
  echo
  selected_path=$(ag . -l -g '' | fzf) || return
  eval 'LBUFFER="$LBUFFER$selected_path"'
  zle reset-prompt
}
zle -N insert-selecta-path-in-command-line
bindkey "^S" "insert-selecta-path-in-command-line"

# bash ctrl-u behaviour
# @see https://stackoverflow.com/questions/4405200/can-i-make-control-u-behavior-be-the-same-for-zsh-as-it-is-for-bash
bindkey '^U' backward-kill-line
bindkey '^Y' yank

# handy key bindings
# bindkey "^S" beginning-of-line
bindkey "^E" end-of-line
bindkey "^K" kill-line
bindkey "^P" history-search-backward
bindkey "^N" insert-last-word
bindkey "^Q" push-line-or-edit

HISTSIZE=1000000
SAVEHIST=1000000

alias v=nvim
export FZF_DEFAULT_COMMAND='ag -g ""'
alias gp="git pull origin main"
alias gm="git checkout main"
alias gc="git commit --verbose --no-verify"
alias gca="git commit --amend --no-verify"
alias gd="git branch -D"
alias kn="killall -9 node"
alias jest="npx jest --watch"

eval "$(direnv hook zsh)"
export GITHUB_TOKEN=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
# export NVM_DIR="$HOME/.nvm"

# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH=~/.nvm/versions/node/v16.13.2/bin:$PATH

export NVM_DIR=~/.nvm
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh" --no-use

# source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
# source /opt/homebrew/opt/chruby/share/chruby/auto.sh

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
