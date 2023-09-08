#!/usr/bin/env zsh

if [ -f ~/.zshrc ]; then
  mv ~/.zshrc ~/.zshrc.bak
fi

# Install the antigen plugin/theme manager if it's not already installed.
if [[ ! -d $HOME/antigen ]]; then
	echo -e "Antigen not found, installing..."
	cd $HOME
	git clone https://github.com/zsh-users/antigen.git
	cd -
fi

if ! command -v starship &> /dev/null
then
	cargo install starship --locked
fi

if ! command -v bob &> /dev/null
then
	cargo install bob-nvim --locked
fi

make delete && make
