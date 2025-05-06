HOME := $(shell echo $$HOME)

all: stow_files copy_to_shopify

stow_files:
	stow --verbose --target=$(HOME) --restow neovim
	stow --verbose --target=$(HOME) --restow kitty
	stow --verbose --target=$(HOME) --restow gitconfig
	stow --verbose --target=$(HOME) --restow ripgrep
	stow --verbose --target=$(HOME) --restow zsh
	stow --verbose --target=$(HOME) --restow tmux
	stow --verbose --target=$(HOME) --restow starship
	stow --verbose --target=$(HOME) --restow pryrc
	stow --verbose --target=$(HOME) --restow cursor

copy_to_shopify:
	@if [ -d "$(HOME)/world/trees/root/src/areas/core/shopify" ]; then \
		mkdir -p "$(HOME)/world/trees/root/src/areas/core/shopify/.cursor/rules/personal"; \
		for file in $(HOME)/.cursor/rules/*; do \
			if [ -f $$file ]; then \
				cp -f $$file "$(HOME)/world/trees/root/src/areas/core/shopify/.cursor/rules/personal/"; \
				echo "copied $$(basename $$file) to shopify core directory"; \
			fi; \
		done; \
	else \
		echo "Shopify directory does not exist!"; \
	fi

delete:
	stow --verbose --target=$(HOME) --delete neovim
	stow --verbose --target=$(HOME) --delete kitty
	stow --verbose --target=$(HOME) --delete gitconfig
	stow --verbose --target=$(HOME) --delete ripgrep
	stow --verbose --target=$(HOME) --delete zsh
	stow --verbose --target=$(HOME) --delete tmux
	stow --verbose --target=$(HOME) --delete starship
	stow --verbose --target=$(HOME) --delete cursor
