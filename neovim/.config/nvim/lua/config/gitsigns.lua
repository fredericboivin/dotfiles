local M = {}

function M.setup()
  require("gitsigns").setup {
    numhl = true,
    linehl = true,
    word_diff = false,
  }
end

return M
