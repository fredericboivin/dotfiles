local M = {}

function M.setup()
  require("neotest").setup {
    discovery = {
      concurrent = 1
    },
    diagnostic = {
      enabled = true
    },
    adapters = {
      require "neotest-python" {
        dap = { justMyCode = false },
        runner = "unittest",
      },
      require "neotest-jest",
      require "neotest-go",
      require "neotest-plenary",
      require "neotest-vim-test" {
        ignore_file_types = { "python", "vim", "lua" },
      },
    },
  }
end

return M
