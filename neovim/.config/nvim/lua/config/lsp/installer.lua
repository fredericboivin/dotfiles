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
    ["ruby_ls"] = function()
      local opts = vim.tbl_deep_extend("force", server_options, servers["ruby_ls"] or {})
      require'lspconfig'.ruby_ls.setup{
        cmd = { "bundle", "exec", "ruby-lsp" },
        filetypes = { "ruby" },
        init_options = {
          enabledFeatures = {
            "documentHighlights",
            -- "documentSymbols",
            "foldingRanges",
            "selectionRanges",
            -- "semanticHighlighting",
            "formatting",
            "codeActions",
          },

        },
        server = opts,
      }
    end,
    ["tsserver"] = function()
      local opts = vim.tbl_deep_extend("force", server_options, servers["tsserver"] or {})
      require("typescript").setup {
        disable_commands = false,
        debug = true,
        server = opts,
      }
    end,
  }
end

return M
