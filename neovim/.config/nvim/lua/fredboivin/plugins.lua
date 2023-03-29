-- Plugins
-- load vim plug if it is not installed
if vim.fn.empty(vim.fn.glob("~/.config/nvim/autoload/plug.vim")) == 1 then
  vim.cmd(
  "silent !curl -fLo ~/.config/nvim/autoload/plug.vim " ..
  "--create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  )
  vim.cmd("autocmd VimEnter * PlugInstall --sync | source $MYVIMRC")
end

local Plug = vim.fn["plug#"]

-- Plug('nvim-telescope/telescope-fzf-native.nvim', { ['do'] = 'make' })

vim.fn["plug#begin"]("~/.config/nvim/plugged")
-- ================= looks and GUI stuff ==================
-- Plug('github/copilot.vim')
-- Plug('tpope/vim-sensible')
-- Plug('tpope/vim-fugitive')
-- Plug('tpope/vim-unimpaired')
-- Plug('nvim-lua/plenary.nvim')
--Plug('nvim-telescope/telescope.nvim', { ['tag'] = '0.1.0' })
--Plug('nvim-telescope/telescope-live-grep-args.nvim')
--Plug('nvim-telescope/telescope-fzy-native.nvim')
-- Plug('BurntSushi/ripgrep')
-- Plug ('junegunn/fzf', { ['do'] = vim.fn["fzf#install()"] })
-- Plug ('junegunn/fzf.vim')
-- Plug("rhysd/clever-f.vim")
-- Plug("tpope/vim-surround")
-- Plug('stevearc/dressing.nvim')
-- Plug("onsails/lspkind-nvim") -- icons for auto complete
-- Plug("jose-elias-alvarez/nvim-lsp-ts-utils")
-- Plug("ray-x/lsp_signature.nvim")
-- Plug 'williamboman/mason.nvim'
-- Plug 'williamboman/mason-lspconfig.nvim'
-- Plug 'neovim/nvim-lspconfig'

-- Treesitter
-- Plug("nvim-treesitter/nvim-treesitter", {["do"] = ":TSUpdate"})
-- Plug("nvim-treesitter/nvim-treesitter-textobjects")
-- Plug("windwp/nvim-ts-autotag")
-- Plug("nvim-treesitter/playground")
vim.fn["plug#end"]()
