local M = {}

function M.setup(servers, server_options)
  local lspconfig = require "lspconfig"

  require("mason").setup {}

  require("mason-lspconfig").setup {
    ensure_installed = vim.tbl_keys(servers),
    automatic_installation = false,
  }

  -- Package installation folder
  local install_root_dir = vim.fn.stdpath "data" .. "/mason"

  require("mason-lspconfig").setup_handlers {
    function(server_name)
      local opts = vim.tbl_deep_extend("force", server_options, servers[server_name] or {})
      lspconfig[server_name].setup(opts)
    end,
  }
end

return M
