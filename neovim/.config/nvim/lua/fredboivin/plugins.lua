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

vim.fn["plug#begin"]("~/.config/nvim/plugged")
-- ================= looks and GUI stuff ==================
Plug("vim-airline/vim-airline") -- airline status bar
Plug('github/copilot.vim')
Plug('ellisonleao/gruvbox.nvim')
Plug('tpope/vim-sensible')
Plug('tpope/vim-fugitive')
-- Plug ('vim-ruby/vim-ruby')
Plug ('skywind3000/asyncrun.vim')
-- Plug ('pangloss/vim-javascript')


-- FUCK YOU Plug ('leafgarland/typescript-vim')
-- Plug ('peitalin/vim-jsx-typescript')
Plug ('tpope/vim-dispatch')
Plug ('vim-test/vim-test')
Plug ('junegunn/fzf', { ['do'] = vim.fn["fzf#install()"] })
Plug ('junegunn/fzf.vim')
Plug ('preservim/nerdtree')
-- Plug ('Xuyuanp/nerdtree-git-plugin')
Plug ('romgrk/winteract.vim')
Plug ('neomake/neomake')
Plug ('williamboman/nvim-lsp-installer')

Plug("mhinz/vim-startify")
Plug("joshdick/onedark.vim") -- dark theme

Plug("onsails/lspkind-nvim") -- icons for auto complete
Plug("neovim/nvim-lspconfig")
Plug("jose-elias-alvarez/nvim-lsp-ts-utils")
Plug("ray-x/lsp_signature.nvim")
Plug("hrsh7th/cmp-nvim-lsp")
Plug("hrsh7th/cmp-nvim-lua") -- nvim-cmp source for neovim Lua API.
Plug("hrsh7th/cmp-buffer") -- nvim-cmp source buffers
Plug("hrsh7th/cmp-cmdline") -- completion for command line
Plug("hrsh7th/cmp-path") -- patho completion
Plug("hrsh7th/cmp-calc") -- math operations completion
Plug("hrsh7th/cmp-emoji") -- emoji completion
Plug("ray-x/cmp-treesitter")
Plug("hrsh7th/nvim-cmp")

-- Treesitter
Plug("nvim-treesitter/nvim-treesitter", {["do"] = ":TSUpdate"})
Plug("nvim-treesitter/nvim-treesitter-textobjects")
Plug("windwp/nvim-ts-autotag")
Plug("nvim-treesitter/playground")

vim.fn["plug#end"]()

