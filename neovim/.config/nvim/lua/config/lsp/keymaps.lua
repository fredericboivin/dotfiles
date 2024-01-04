local M = {}

local whichkey = require("which-key")

local keymap = vim.api.nvim_set_keymap
local buf_keymap = vim.api.nvim_buf_set_keymap

local function keymappings(client, bufnr)
  local opts = { noremap = true, silent = true }

  -- Key mappings
  buf_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
  keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
  keymap("n", "[e", "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<CR>", opts)
  keymap("n", "]e", "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<CR>", opts)

  -- Whichkey
  local keymap_l = {
    l = {
      name = "Code",
      a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
      n = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
      s = { "<cmd>AerialToggle<CR>", "Aerials sidebar" },
      -- R = { "<cmd>Trouble lsp_references<cr>", "Trouble References" },
      -- d = { "<cmd>Telescope diagnostics<CR>", "Telescope diagnostics" },
      -- f = { "<cmd>lua vim.diagnostic.setloclist()<CR>", "Diagnostics loclist" },
      -- i = { "<cmd>LspInfo<CR>", "Lsp Info" },
      -- r = { "<cmd>Telescope lsp_references<CR>", "Telescope lsp_references" },
      -- t = { "<cmd>TroubleToggle<CR>", "Toggle Trouble" },
    },
  }

  if client.server_capabilities.documentFormattingProvider then
    keymap_l.l.F = { "<cmd>lua vim.lsp.buf.format({async = true})<CR>", "Format Document" }
  end

  local keymap_g = {
    name = "Goto",
    d = { "<cmd>Telescope lsp_definitions<cr>", "Definition" },
    D = { "<Cmd>lua vim.lsp.buf.declaration()<CR>", "Declaration" },
    r = { "<cmd>Telescope lsp_references<cr>", "References" },
    I = { "<cmd>Telescope lsp_implementations<cr>", "Implementations" },
    t = { "<cmd>Telescope lsp_type_definitions<cr>", "Type definitions" },
    s = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help" },
    -- t = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Goto Type Definition" },
    -- d = { "<Cmd>lua vim.lsp.buf.definition()<CR>", "Definition" },
    -- I = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Goto Implementation" },
  }

  local keymap_t = {
    t = {
      name = "Trouble",
      -- d = { "<Cmd>Trouble document_diagnostics<CR>", "Document diagnostics" },
      w = { "<Cmd>Trouble workspace_diagnostics<CR>", "Workspace diagnostics" },
      r = { "<cmd>Trouble lsp_references<cr>", "Trouble lsp_references" },
      d = { "<cmd>Trouble lsp_definitions<cr>", "Trouble lsp_definitions" },
      D = { "<cmd>Trouble lsp_type_definitions<cr>", "Trouble lsp_type_definitions" },
      q = { "<Cmd>Trouble quickfix<CR>", "Quickfix" },
      l = { "<Cmd>Trouble loclist<CR>", "Loclist" },
      t = { "<Cmd>TroubleToggle<CR>", "Toggle" },
    },
  }

  whichkey.register(keymap_l, { buffer = bufnr, prefix = "<leader>" })
  whichkey.register(keymap_t, { buffer = bufnr, prefix = "<leader>" })
  whichkey.register(keymap_g, { buffer = bufnr, prefix = "g" })
end

function M.setup(client, bufnr)
  keymappings(client, bufnr)
end

return M
