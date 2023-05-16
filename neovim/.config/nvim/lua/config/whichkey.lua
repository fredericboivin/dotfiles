local M = {}

function M.setup()
  local whichkey = require("which-key")

  local conf = {
    window = {
      border = "single",   -- none, single, double, shadow
      position = "bottom", -- bottom, top
    },
  }

  local opts = {
    mode = "n",     -- Normal mode
    prefix = "<leader>",
    buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true,  -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
  }

  local mappings = {
    b = {
      name = "Buffer",
      c = { "<Cmd>bd!<Cr>", "Close" },
      D = { "<Cmd>%bd|e#|bd#<Cr>", "Delete all" },
      b = { "<cmd>BufferLinePick<Cr>", "Pick" },
      o = { "<Cmd>%bd|e#|bd#<Cr>", "Delete others" },
    },
    z = {
      name = "Packer",
      c = { "<cmd>PackerCompile<cr>", "Compile" },
      i = { "<cmd>PackerInstall<cr>", "Install" },
      p = { "<cmd>PackerProfile<cr>", "Profile" },
      s = { "<cmd>PackerSync<cr>", "Sync" },
      S = { "<cmd>PackerStatus<cr>", "Status" },
      u = { "<cmd>PackerUpdate<cr>", "Update" },
    },
    g = {
      name = "Git",
      c = { "<cmd>0GcLog<cr>", "File log" },
    },
    n = {
      name = "Neotest",
      a = { "<cmd>lua require('neotest').run.attach()<cr>", "Attach" },
      f = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "Run File" },
      F = { "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>", "Debug File" },
      l = { "<cmd>lua require('neotest').run.run_last()<cr>", "Run Last" },
      L = { "<cmd>lua require('neotest').run.run_last({ strategy = 'dap' })<cr>", "Debug Last" },
      n = { "<cmd>lua require('neotest').run.run()<cr>", "Run Nearest" },
      N = { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", "Debug Nearest" },
      o = { "<cmd>lua require('neotest').output.open({ enter = true })<cr>", "Output" },
      S = { "<cmd>lua require('neotest').run.stop()<cr>", "Stop" },
      s = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Summary" },
    },
    f = {
      name = "Find",
      s = { "<cmd>Telescope git_branches<cr>", "Git branches" },
      k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
      f = { "<cmd>Telescope find_files<cr>", "Files" },
      h = { "<cmd>Telescope help_tags<cr>", "Help Tags" },
      d = { "<cmd>lua require('utils.finder').find_dotfiles()<cr>", "Dotfiles" },
      b = { "<cmd>Telescope buffers<cr>", "Buffers" },
      l = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Symbols" },
      o = { "<cmd>Telescope oldfiles<cr>", "Old Files" },
      -- g = { "<cmd>Telescope live_grep --hidden=true<cr>", "Live Grep" },
      g = {
        "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>",
        "Live Grep" },
      c = { "<cmd>Telescope commands<cr>", "Commands" },
      r = { "<cmd>Telescope file_browser<cr>", "Browser" },
      w = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Current Buffer" },
      e = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
    },
    t = {
      name = "Trouble",
      d = { "<Cmd>Trouble document_diagnostics<CR>", "Document diagnostics" },
      w = { "<Cmd>Trouble workspace_diagnostics<CR>", "Workspace diagnostics" },
      r = { "<cmd>Trouble lsp_references<cr>", "Trouble References" },
      q = { "<Cmd>Trouble quickfix<CR>", "Quickfix" },
      l = { "<Cmd>Trouble loclist<CR>", "Loclist" },
      t = { "<Cmd>TroubleToggle<CR>", "Toggle" },
    },
    p = {
      name = "Project",
      p = { "<cmd>lua require'telescope'.extensions.projects.projects{}<cr>", "List" },
      d = { "<Cmd>G difftool<CR> | <Cmd>cclose<CR> | <Cmd>Trouble quickfix<CR>", 'Test' }
    },
  }

  whichkey.setup(conf)
  whichkey.register(mappings, opts)
end

return M
