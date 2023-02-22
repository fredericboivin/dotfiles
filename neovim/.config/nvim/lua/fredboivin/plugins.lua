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
-- Plug ('pangloss/vim-javascript')
-- FUCK YOU Plug ('leafgarland/typescript-vim')
-- Plug ('peitalin/vim-jsx-typescript')
-- Plug ('Xuyuanp/nerdtree-git-plugin')
-- Plug ('romgrk/winteract.vim')
-- Plug ('neomake/neomake')
-- Plug ('williamboman/nvim-lsp-installer')
-- Plug("mhinz/vim-startify")
-- Plug("goolord/alpha-nvim")
-- Plug("hrsh7th/cmp-nvim-lua") -- nvim-cmp source for neovim Lua API.
-- Plug("hrsh7th/cmp-cmdline") -- completion for command line
-- Plug("hrsh7th/cmp-calc") -- math operations completion
-- Plug("hrsh7th/cmp-emoji") -- emoji completion

vim.fn["plug#begin"]("~/.config/nvim/plugged")
-- ================= looks and GUI stuff ==================
Plug('github/copilot.vim')
-- Plug("vim-airline/vim-airline") -- airline status bar
Plug('tpope/vim-sensible')
Plug('tpope/vim-fugitive')
Plug('tpope/vim-unimpaired')
Plug ('vim-ruby/vim-ruby')
-- Plug('ellisonleao/gruvbox.nvim')
-- Plug ('skywind3000/asyncrun.vim')
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', { ['tag'] = '0.1.0' })
Plug('nvim-telescope/telescope-live-grep-args.nvim')
Plug('nvim-telescope/telescope-fzy-native.nvim')
Plug 'folke/which-key.nvim'
Plug('BurntSushi/ripgrep')
Plug('christoomey/vim-tmux-navigator')
-- Plug ('tpope/vim-dispatch')
-- Plug ('vim-test/vim-test')
Plug ('junegunn/fzf', { ['do'] = vim.fn["fzf#install()"] })
Plug ('junegunn/fzf.vim')
Plug ('preservim/nerdtree')
Plug("rhysd/clever-f.vim")
Plug("tpope/vim-surround")
Plug("navarasu/onedark.nvim") -- dark theme
Plug('stevearc/dressing.nvim')
Plug("onsails/lspkind-nvim") -- icons for auto complete
Plug("jose-elias-alvarez/nvim-lsp-ts-utils")
Plug("ray-x/lsp_signature.nvim")
Plug("ray-x/cmp-treesitter")
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'

Plug("hrsh7th/nvim-cmp")
Plug("hrsh7th/cmp-buffer") -- nvim-cmp source buffers
Plug("hrsh7th/cmp-path") -- patho completion
Plug("saadparwaiz1/cmp_luasnip")
Plug("hrsh7th/cmp-nvim-lsp")
Plug("L3MON4D3/LuaSnip")
Plug 'rafamadriz/friendly-snippets'


-- Treesitter
Plug("nvim-treesitter/nvim-treesitter", {["do"] = ":TSUpdate"})
Plug("nvim-treesitter/nvim-treesitter-textobjects")
Plug("windwp/nvim-ts-autotag")
Plug("nvim-treesitter/playground")
Plug 'kyazdani42/nvim-web-devicons'
vim.fn["plug#end"]()
