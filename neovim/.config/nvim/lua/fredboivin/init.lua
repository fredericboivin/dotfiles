
require("fredboivin.packer_plugins").setup();
require("fredboivin.plugins");
require("fredboivin.lsp_signature");
require("fredboivin.lsp");
require("fredboivin.treesitter");
require("fredboivin.telescope");
require("fredboivin.dressing");
require("fredboivin.onedark");

function _G.ReloadConfig()
    for name, _ in pairs(package.loaded) do
        if name:match("^fredboivin") or name:match("lsp") then
            package.loaded[name] = nil
        end
    end

    vim.api.nvim_command("!make delete -C ~/dotfiles")
    vim.api.nvim_command("!make -C ~/dotfiles")
    dofile(vim.fn.expand("$HOME/.config/nvim/lua/fredboivin/init.lua"))
    -- vim.api.nvim_command("so $HOME/.config/nvim/init.vim")
    vim.api.nvim_command("so $MYVIMRC")
    vim.api.nvim_command("PackerSync")

    print("Vim config reloaded!")
end

vim.api.nvim_set_keymap(
    "n", "<localleader>3", "<Cmd>lua ReloadConfig()<CR>",
    {silent = silent, noremap = true}
)

vim.cmd("command! ReloadConfig lua ReloadConfig()")
