 if [ -f ~/.zshrc ]; then
  mv ~/.zshrc ~/.zshrc.bak
fi
make delete && make
