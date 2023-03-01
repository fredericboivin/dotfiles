local M = {}

local servers = {
  html = {},
  jsonls = {},
  pyright = {},
  rust_analyzer = {},
  tsserver = {},
  vimls = {},
}

local function on_attach(client, bufnr)
  -- Enable completion triggered by <C-X><C-O>
  -- See `:help omnifunc` and `:help ins-completion` for more information.
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Use LSP as the handler for formatexpr.
  -- See `:help formatexpr` for more information.
  vim.api.nvim_buf_set_option(0, "formatexpr", "v:lua.vim.lsp.formatexpr()")

  -- Configure key mappings
  require("config.lsp.keymaps").setup(client, bufnr)

   -- Configure highlighting
  require("config.lsp.highlighter").setup(client)
  require("config.lsp.null-ls.formatters").setup(client, bufnr)
end

local opts = {
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  },
}

-- Setup LSP handlers
require("config.lsp.handlers").setup()

function M.setup()
   -- null-ls
  require("config.lsp.null-ls").setup(opts)
  require("config.lsp.installer").setup(servers, opts)
end

return M
