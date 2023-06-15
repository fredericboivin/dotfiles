 if [ -f ~/.zshrc ]; then
  mv ~/.zshrc ~/.zshrc.bak
fi

if ! command -v starship &> /dev/null
then
    curl -sS https://starship.rs/install.sh | sh
fi

make delete && make
