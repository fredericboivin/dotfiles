if [ -f ~/.zshrc ]; then
  mv ~/.zshrc ~/.zshrc.bak
fi

if ! command -v starship &> /dev/null
then
	cargo install starship --locked
fi

make delete && make
