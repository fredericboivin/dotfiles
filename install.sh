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

if [ -f /etc/spin/secrets/copilot-credentials ]; then
	mkdir -p ~/.config/github-copilot/ && ln -s /etc/spin/secrets/copilot-credentials ~/.config/github-copilot/hosts.json
fi

bob install nightly
bob use nightly

make delete && make
nvim --headless "+Lazy! sync" +qa || true
