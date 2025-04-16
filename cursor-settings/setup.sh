#!/bin/bash

# Set up symlinks for Cursor settings
CURSOR_SETTINGS_DIR="$HOME/Library/Application Support/Cursor/User"
DOTFILES_CURSOR_DIR="$HOME/dotfiles/cursor-settings/User"

# Create directories if they don't exist
mkdir -p "$CURSOR_SETTINGS_DIR"
mkdir -p "$CURSOR_SETTINGS_DIR/snippets"

# Create backups if files exist
if [ -f "$CURSOR_SETTINGS_DIR/settings.json" ]; then
  mv "$CURSOR_SETTINGS_DIR/settings.json" "$CURSOR_SETTINGS_DIR/settings.json.bak"
  echo "✅ Created backup of settings.json"
fi

if [ -f "$CURSOR_SETTINGS_DIR/keybindings.json" ]; then
  mv "$CURSOR_SETTINGS_DIR/keybindings.json" "$CURSOR_SETTINGS_DIR/keybindings.json.bak"
  echo "✅ Created backup of keybindings.json"
fi

if [ -f "$CURSOR_SETTINGS_DIR/snippets/global.code-snippets" ]; then
  mv "$CURSOR_SETTINGS_DIR/snippets/global.code-snippets" "$CURSOR_SETTINGS_DIR/snippets/global.code-snippets.bak"
  echo "✅ Created backup of global.code-snippets"
fi

# Create symlinks
ln -sf "$DOTFILES_CURSOR_DIR/settings.json" "$CURSOR_SETTINGS_DIR/settings.json"
ln -sf "$DOTFILES_CURSOR_DIR/keybindings.json" "$CURSOR_SETTINGS_DIR/keybindings.json"
ln -sf "$DOTFILES_CURSOR_DIR/snippets/global.code-snippets" "$CURSOR_SETTINGS_DIR/snippets/global.code-snippets"

echo "✅ Cursor settings successfully linked from dotfiles"
echo "🔁 Restart Cursor for changes to take effect"