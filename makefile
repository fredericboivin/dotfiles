all:
	stow --verbose --target=$$HOME --restow neovim
	stow --verbose --target=$$HOME --restow kitty
	stow --verbose --target=$$HOME --restow gitconfig 
	stow --verbose --target=$$HOME --restow ripgrep
	stow --verbose --target=$$HOME --restow zsh
	stow --verbose --target=$$HOME --restow tmux
	stow --verbose --target=$$HOME --restow starship
	stow --verbose --target=$$HOME --restow pryrc

delete:
	stow --verbose --target=$$HOME --delete neovim
	stow --verbose --target=$$HOME --delete kitty
	stow --verbose --target=$$HOME --delete gitconfig 
	stow --verbose --target=$$HOME --delete ripgrep
	stow --verbose --target=$$HOME --delete zsh
	stow --verbose --target=$$HOME --delete tmux
	stow --verbose --target=$$HOME --delete starship
	stow --verbose --target=$$HOME --delete pryrc
