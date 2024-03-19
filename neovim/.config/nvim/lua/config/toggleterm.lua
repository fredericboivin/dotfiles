local toggleterm = require('toggleterm')

toggleterm.setup({
  open_mapping = '<C-g>',
  hide_number = true,
  start_in_insert = true,
  autochdir = true,
  shade_terminals = true,
  float_opts = {
    width = function()
      return math.ceil(vim.o.columns * 0.95)
    end,
    height = function()
      return math.ceil(vim.o.lines * 0.85)
    end,
    highlights = {
      border = "FloatBorder",
      background = "NormalFloat",
    },
  },
  direction = 'float',   -- vertical | float | tab
})

local terminal = require("toggleterm.terminal").Terminal

local lazygit = terminal:new({
  cmd = "lazygit",
  dir = "git_dir",
  direction = "float",
  float_opts = {
    border = "double",
  },
  on_open = function(_term)
    vim.cmd("startinsert!")
  end,
  on_close = function(_term)
    vim.cmd("startinsert!")
  end,
})
local cur_cwd = vim.fn.getcwd()

local function _lazygit_toggle()
  local cwd = vim.fn.getcwd()
  if cwd ~= cur_cwd then
    cur_cwd = cwd
    lazygit:close()
    lazygit = terminal:new({ cmd = "lazygit", direction = "float" })
  end
  lazygit:toggle()
end

return {
  lazygit_toggle = _lazygit_toggle,
}
