local M = {}

function M.setup()
  require("project_nvim").setup {
    detection_methods = { "pattern" },
    patterns = { "Gemfile", ".git" },
    ignore_lsp = { "null-ls" },
    silent_chdir = true,
  }
end

return M
