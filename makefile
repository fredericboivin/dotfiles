all:
	stow --verbose --target=$$HOME --restow neovim
	stow --verbose --target=$$HOME --restow kitty
	stow --verbose --target=$$HOME --restow gitconfig 
	stow --verbose --target=$$HOME --restow ripgrep
	stow --verbose --target=$$HOME --restow zsh
	stow --verbose --target=$$HOME --restow tmux
	stow --verbose --target=$$HOME --restow starship
	stow --verbose --target=$$HOME --restow pryrc
	stow --verbose --target=$$HOME --restow cursor
	@if [ -d $$HOME/world/trees/root/src/areas/core/shopify ]; then \
		mkdir -p $$HOME/world/trees/root/src/areas/core/shopify/.cursor; \
		ln -sf $$HOME/.cursor/rules $$HOME/world/trees/root/src/areas/core/shopify/.cursor/rules; \
		echo "Linked Cursor rules to Shopify core directory"; \
	fi

delete:
	stow --verbose --target=$$HOME --delete neovim
	stow --verbose --target=$$HOME --delete kitty
	stow --verbose --target=$$HOME --delete gitconfig 
	stow --verbose --target=$$HOME --delete ripgrep
	stow --verbose --target=$$HOME --delete zsh
	stow --verbose --target=$$HOME --delete tmux
	stow --verbose --target=$$HOME --delete starship
	stow --verbose --target=$$HOME --delete cursor
