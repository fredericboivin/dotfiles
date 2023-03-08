
local M = {}

function M.setup()
  require('dressing').setup({
    input = { relative = "editor" },
    select = {
      backend = { "telescope", "fzf", "builtin" },
    },
  });
end

return M
