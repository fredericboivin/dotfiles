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

case $( uname -s ) in
	Linux) /bin/sh setup_linux;;
	Darwin) /bin/sh setup_mac;;
	*)     echo other;;
esac

if ! command -v bob &> /dev/null
then
	cargo install bob-nvim@2.5.0 --locked
fi

make delete && make
nvim --headless "+Lazy install"
