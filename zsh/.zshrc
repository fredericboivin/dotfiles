export PATH=$HOME/bin:/usr/local/bin:$PATH
alias zshreload="source ~/.zshrc"

autoload -Uz compinit
compinit

eval "$(starship init zsh)"

# bash ctrl-u behaviour
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
