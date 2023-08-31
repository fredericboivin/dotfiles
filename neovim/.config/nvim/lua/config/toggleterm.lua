local M = {}

function M.setup()
  require("toggleterm").setup {
    float_opts = {
      width = 100,
      height = 100,
      winblend = 3,
      zindex = 10, 
    },
  }
end

return M
