local M = {}

function M.setup()
  require("nvim-tree").setup {
    disable_netrw = true,
    hijack_netrw = true,
    view = {
      number = true,
      relativenumber = true,
      width = 50,
    },
    filters = {
      custom = { ".git" },
    },
    update_cwd = true,
    respect_buf_cwd = true,
    update_focused_file = {
      enable = true,
      update_cwd = true
    },
  }
end

return M
