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

  local function smart_search()
    local query = vim.fn.input("Search: ")
    vim.cmd("OpenBrowserSmartSearch " .. query)
  end

  local mappings = {
    b = {
      name = "Buffer",
      c = { "<Cmd>bd!<Cr>", "Close" },
      D = { "<Cmd>%bd|e#|bd#<Cr>", "Delete all" },
      b = { "<cmd>BufferLinePick<Cr>", "Pick" },
      o = { "<Cmd>%bd|e#|bd#<Cr>", "Delete others" },
    },
    h = {
      name = "Harpoon",
      t = { "<Cmd>lua require('harpoon.term').gotoTerminal(1)<CR>", "Terminal 1" },
    },
    g = {
      name = "Git",
      c = { "<Cmd>0GcLog<CR>", 'Commit history' },
      g = { "<cmd>lua require('config.toggleterm').lazygit_toggle()<cr>", "Git" },
      b = { "<cmd>Gitsigns toggle_current_line_blame<cr>", "Blame" },
      d = { "<cmd>lua require('gitsigns').diffthis()<cr>", "Diff this" },
      D = { "<cmd>lua require('gitsigns').diffthis('~')<cr>", "Diff this" },
    },
    n = {
      name = "Neotest",
      f = { "<cmd>TestFile <cr>", "File" },
      n = { "<cmd>TestNearest<cr>", "Nearest" },
      -- a = { "<cmd>lua require('neotest').run.attach()<cr>", "Attach" },
      -- f = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "Run File" },
      -- F = { "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>", "Debug File" },
      -- l = { "<cmd>lua require('neotest').run.run_last()<cr>", "Run Last" },
      -- L = { "<cmd>lua require('neotest').run.run_last({ strategy = 'dap' })<cr>", "Debug Last" },
      -- n = { "<cmd>lua require('neotest').run.run()<cr>", "Run Nearest" },
      -- N = { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", "Debug Nearest" },
      -- o = { "<cmd>lua require('neotest').output.open({ enter = true })<cr>", "Output" },
      -- S = { "<cmd>lua require('neotest').run.stop()<cr>", "Stop" },
      -- s = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Summary" },
    },
    f = {
      name = "Find",
      a = { "<cmd>Telescope telescope-alternate alternate_file<cr>", "Alternate" },
      s = { "<cmd>Telescope git_branches<cr>", "Git branches" },
      k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
      -- f = { "<cmd>Telescope find_files<cr>", "Files" },
      f = { "<cmd>Files<cr>", "Files" },
      h = { "<cmd>Telescope help_tags<cr>", "Help Tags" },
      d = { "<cmd>lua require('utils.finder').find_dotfiles()<cr>", "Dotfiles" },
      b = { "<cmd>Telescope buffers<cr>", "Buffers" },
      l = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Dynamic workspace symbols" },
      o = { "<cmd>Telescope oldfiles<cr>", "Old Files" },
      g = {
        "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>",
        "Live Grep"
      },
      c = { "<cmd>Telescope commands<cr>", "Commands" },
      w = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Current Buffer" },
      r = { "<cmd>Telescope resume<cr>", "Resume" },
      e = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
    },
    p = {
      name = "Project",
      p = { "<cmd>lua require'telescope'.extensions.projects.projects{}<cr>", "List" },
      d = { "<Cmd>G difftool<CR> | <Cmd>cclose<CR> | <Cmd>Trouble quickfix<CR>", 'Current changelist' }
    },
    o = {
      name = "Browser",
      s = { smart_search, "Smart Search" },
      p = { "<cmd>OpenGithubProject<cr>", "Github Project" },
      f = { "<cmd>OpenGithubFile<cr>", "Github File" },
    },
  }

  whichkey.setup(conf)
  whichkey.register(mappings, opts)
end

return M
