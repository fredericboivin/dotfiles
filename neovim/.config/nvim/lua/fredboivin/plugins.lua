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
Plug ('ellisonleao/gruvbox.nvim')
Plug ('tpope/vim-sensible')
Plug ('tpope/vim-fugitive')
Plug ('vim-ruby/vim-ruby')
Plug ('skywind3000/asyncrun.vim')
Plug ('neoclide/coc.nvim', {['branch'] = 'release'})
Plug ('nvim-treesitter/nvim-treesitter', { ['do'] = vim.fn[":TSUpdate"]})
Plug ('pangloss/vim-javascript')
Plug ('leafgarland/typescript-vim')
Plug ('peitalin/vim-jsx-typescript')
Plug ('tpope/vim-dispatch')
Plug ('janko-m/vim-test')
Plug ('junegunn/fzf', { ['do'] = vim.fn["fzf#install()"] })
Plug ('junegunn/fzf.vim')
Plug ('preservim/nerdtree')
Plug ('Xuyuanp/nerdtree-git-plugin')
Plug ('romgrk/winteract.vim')

Plug("mhinz/vim-startify")
Plug("joshdick/onedark.vim") -- dark theme

vim.fn["plug#end"]()
