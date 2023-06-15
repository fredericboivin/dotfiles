# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

export PATH=$HOME/bin:/usr/local/bin:$PATH
alias zshreload="source ~/.zshrc"

# ZINIT
# ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
# [ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
# [ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
# 
# source "${ZINIT_HOME}/zinit.zsh"
# 
# zinit light romkatv/powerlevel10k
# # Load pure theme
# zinit ice pick"async.zsh" src"pure.zsh" # with zsh-async library that's bundled with it.
# zinit light sindresorhus/pure
# zinit snippet https://github.com/sainnhe/dotfiles/raw/master/.zsh-theme/everforest-dark.zsh

autoload -Uz compinit
compinit

eval "$(starship init zsh)"

# bash ctrl-u behaviour
# @see https://stackoverflow.com/questions/4405200/can-i-make-control-u-behavior-be-the-same-for-zsh-as-it-is-for-bash
bindkey '^U' backward-kill-line
bindkey '^Y' yank

# handy key bindings
# bindkey "^S" beginning-of-line
# bindkey "^E" end-of-line
# bindkey "^K" kill-line
# bindkey "^P" history-search-backward
# bindkey "^N" insert-last-word
# bindkey "^Q" push-line-or-edit

HISTSIZE=1000000
SAVEHIST=1000000

alias v=nvim
export FZF_DEFAULT_COMMAND='ag -g ""'

# Dev
[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# CTRL-t	Fuzzy find all files and subdirectories of the working directory, and output the selection to STDOUT.
# ALT-c	Fuzzy find all subdirectories of the working directory, and run the command “cd” with the output as argument.
# CTRL-r	Fuzzy find through your shell history, and output the selection to STDOUT.

# ripgrep
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

# chruby 
[[ -f /opt/dev/sh/chruby/chruby.sh ]] && { type chruby >/dev/null 2>&1 || chruby () { source /opt/dev/sh/chruby/chruby.sh; chruby "$@"; } }
[[ -x /opt/homebrew/bin/brew ]] && eval $(/opt/homebrew/bin/brew shellenv)

# source /opt/homebrew/opt/chruby/share/chruby/auto.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
