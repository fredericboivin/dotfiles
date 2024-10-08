local M = {}

function M.setup()
  require("nvim-treesitter.configs").setup {
    -- One of "all", "maintained" (parsers with maintainers), or a list of languages
    ensure_installed = {
      'ruby', 'bash', 'diff', 'lua', 'git_config', 'git_rebase', 'gitcommit',
      'graphql', 'http', 'json', 'luadoc', 'make', 'markdown', 'regex', 'vimdoc', 'vim', 'yaml',
      'typescript', 'tsx', 'javascript'
    },

    -- Install languages synchronously (only applied to `ensure_installed`)
    sync_install = false,

    highlight = {
      enable = true,
      additional_vim_regex_highlighting = { "ruby" },
    },

     incremental_selection = {
       enable = false,
       keymaps = {
         init_selection = "gnn",
         node_incremental = "grn",
         scope_incremental = "grc",
         node_decremental = "grm",
       },
     },

    indent = { enable = true, disable = { "ruby" } },
    -- vim-matchup
    --matchup = {
    --  enable = false,
    --},

    -- nvim-treesitter-textobjects
    -- textobjects = {
    --   select = {:w
    --
    --     enable = true,

    --     -- Automatically jump forward to textobj, similar to targets.vim
    --     lookahead = true,

    --     keymaps = {
    --       -- You can use the capture groups defined in textobjects.scm
    --       ["af"] = "@function.outer",
    --       ["if"] = "@function.inner",
    --       ["ac"] = "@class.outer",
    --       ["ic"] = "@class.inner",
    --     },
    --   },

    --   swap = {
    --     enable = true,
    --     swap_next = {
    --       ["<leader>rx"] = "@parameter.inner",
    --     },
    --     swap_previous = {
    --       ["<leader>rX"] = "@parameter.inner",
    --     },
    --   },

    --   move = {
    --     enable = true,
    --     set_jumps = true, -- whether to set jumps in the jumplist
    --     goto_next_start = {
    --       ["]m"] = "@function.outer",
    --       ["]]"] = "@class.outer",
    --     },
    --     goto_next_end = {
    --       ["]M"] = "@function.outer",
    --       ["]["] = "@class.outer",
    --     },
    --     goto_previous_start = {
    --       ["[m"] = "@function.outer",
    --       ["[["] = "@class.outer",
    --     },
    --     goto_previous_end = {
    --       ["[M"] = "@function.outer",
    --       ["[]"] = "@class.outer",
    --     },
    --   },

    --   lsp_interop = {
    --     enable = true,
    --     border = "none",
    --     peek_definition_code = {
    --       ["<leader>df"] = "@function.outer",
    --       ["<leader>dF"] = "@class.outer",
    --     },
    --   },
    -- },

    -- endwise
    endwise = {
      enable = true,
    },
  }
end

return M
