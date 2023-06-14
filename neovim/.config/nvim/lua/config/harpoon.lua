local M = {}

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

function M.setup()
  vim.keymap.set("n", "<leader>a", mark.add_file)
  vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

  require("harpoon").setup(
    {
      menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
      }
    }
  )
end

return M
