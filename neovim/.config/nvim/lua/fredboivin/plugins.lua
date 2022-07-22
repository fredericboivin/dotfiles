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

vim.fn["plug#end"]()
