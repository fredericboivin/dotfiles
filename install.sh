#!/usr/bin/env zsh

if [ -f ~/.zshrc ]; then
	mv ~/.zshrc ~/.zshrc.bak
fi

if [[ ! -d $HOME/antigen ]]; then
	cd $HOME
	git clone https://github.com/zsh-users/antigen.git
	cd -
fi

case $( uname -s ) in
	Linux) /bin/sh setup_linux;;
	Darwin) /bin/sh setup_mac;;
	*)     echo other;;
esac

if ! command -v bob &> /dev/null
then
	cargo install bob-nvim@2.5.0 --locked
fi

bob install stable
bob use stable

make delete && make
