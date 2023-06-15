all:
	stow --verbose --target=$$HOME --restow neovim
	stow --verbose --target=$$HOME --restow kitty
	stow --verbose --target=$$HOME --restow gitconfig 
	stow --verbose --target=$$HOME --restow ripgrep
	stow --verbose --target=$$HOME --restow zsh

delete:
	stow --verbose --target=$$HOME --delete neovim
	stow --verbose --target=$$HOME --delete kitty
	stow --verbose --target=$$HOME --delete gitconfig 
	stow --verbose --target=$$HOME --delete ripgrep
	stow --verbose --target=$$HOME --delete zsh
