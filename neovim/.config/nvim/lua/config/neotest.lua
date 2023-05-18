local M = {}

function M.setup()
  require("neotest").setup {
    discovery = {
      concurrent = 0,
      enabled = false
    },
    diagnostic = {
      enabled = true
    },
    adapters = {
      require "neotest-minitest",
    },
  }
end

return M
