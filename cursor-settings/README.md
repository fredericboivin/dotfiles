# Cursor Editor Settings

This directory contains configuration files for Cursor editor, including:

- Vim keybindings and window management
- Code navigation and layout settings
- File context shortcuts for AI chat integration
- Custom key bindings for quick actions
- Snippet templates for documentation and code blocks

## Features

### Vim Configuration
- Leader key set to `,`
- Window navigation with Ctrl+h/j/k/l
- File operations with `,w` (save), `,q` (close)
- Easy file navigation with `,f` (find file)

### File Explorer Configuration
- Optimized for minimal distraction
- No outline view taking up space
- File tree always visible on the left

### Editor Layout
- Clean, distraction-free interface
- Relative line numbers
- No minimap or other visual clutter

### AI Chat Integration
- Quick shortcuts to add file references (`,a`)
- Open chat panel (`,c`)
- Copy file paths (`,p` and `,P`)
- Keyboard shortcuts for adding context to chats

### Code Templates
- Snippets for adding code context to AI chats
- File reference templates
- Code block formatting

## Installation

Run the setup script to create symlinks to your Cursor settings:

```bash
$ ./setup.sh
```

This will:
1. Create backups of your existing settings
2. Create symlinks from these dotfiles to your Cursor config directory
3. Preserve your settings in version control

## Key Bindings

### Vim Mode
- `,w` - Save file
- `,q` - Close editor
- `,f` - Quick open file
- `,e` - Toggle file explorer
- `,/` - Comment/uncomment line
- `,p` - Copy file path
- `,P` - Copy relative file path
- `,c` - Focus chat panel
- `,a` - Add file reference to chat

### Mac Key Bindings
- `Cmd+K Cmd+C` - Focus chat panel
- `Cmd+K Cmd+R` - Add file reference to chat
- `Cmd+K Cmd+P` - Copy file path
- `Cmd+K Cmd+Shift+P` - Copy relative file path
- `Cmd+K Cmd+B` - Wrap selection in code block
- `Cmd+K Cmd+F` - Insert full file reference with code block

## Snippets
- `fileref` - Insert file reference with code block
- `cb` - Insert code block
- `context` - Add file with context for AI chat
- `pathref` - Insert relative file path
- `fullpath` - Insert full file path