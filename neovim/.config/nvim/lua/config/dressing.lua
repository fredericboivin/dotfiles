
local M = {}

function M.setup()
  require('dressing').setup({
    select = {
      backend = { "telescope", "builtin" },
      builtin = {
        win_options = {
          winhighlight = "Normal:Normal,NormalNC:Normal"
        },
      }
    },
  });
end

return M
