require("utils")
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)
require('lazy').setup('fredboivin.packer_plugins', {
  defaults = { lazy = true }
});

vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0

--require("fredboivin.packer_plugins").setup()
-- require("fredboivin.plugins");
-- require("fredboivin.lsp_signature");
-- require("fredboivin.lsp");
-- require("fredboivin.treesitter");
-- require("fredboivin.telescope");
-- require("fredboivin.dressing");
-- require("fredboivin.onedark");

function _G.ReloadConfig()
  vim.api.nvim_command("!make delete -C ~/dotfiles")
  vim.api.nvim_command("!make -C ~/dotfiles")
end

vim.api.nvim_set_keymap("n", "<localleader>3", "<Cmd>lua ReloadConfig()<CR>", { silent = silent, noremap = true })

vim.cmd("command! ReloadConfig lua ReloadConfig()")
