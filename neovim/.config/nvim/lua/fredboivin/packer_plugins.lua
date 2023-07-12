return {
  {
    'lewis6991/impatient.nvim',
    lazy = false,
  },
  {
    "Shopify/shadowenv.vim",
    lazy = false,
  },
  {
    "junegunn/fzf",
    lazy = false,
  },
  {
    "junegunn/fzf.vim",
    dependencies = { "junegunn/fzf" },
    lazy = false,
  },
  {
    "tpope/vim-fugitive",
    event = "VeryLazy",
  },
  {
    "tyru/open-browser-github.vim",
    dependencies = { "tyru/open-browser.vim" },
    event = "VeryLazy",
  },
  {
    "tpope/vim-sensible",
    event = "VeryLazy",
  },
  {
    "tpope/vim-surround",
    event = "VeryLazy",
  },
  {
    "phaazon/hop.nvim",
    lazy = false,
    branch = 'v2',
    config = function()
      require('config.hop').setup()
    end,
  },
  {
    "tpope/vim-unimpaired",
    event = "VeryLazy",
  },
  "nvim-lua/plenary.nvim",
  {
    "ThePrimeagen/harpoon",
    event = "VeryLazy",
    config = function()
      require 'config.harpoon'.setup()
    end,
  },
  {
    'stevearc/dressing.nvim',
    lazy = false,
    config = function()
      require 'config.dressing'.setup()
    end,
  },
  {
    "rcarriga/nvim-notify",
    lazy = false,
    config = function()
      vim.notify = require("notify")
    end,
  },
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require("config.tokyonight").setup()
      vim.cmd [[colorscheme tokyonight-moon]]
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = 'VeryLazy',
    config = function()
      require("config.indent").setup()
    end,
  },
  {
    "folke/which-key.nvim",
    lazy = false,
    config = function()
      require("config.whichkey").setup()
    end,
  },
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    config = function()
      require("alpha").setup(require("alpha.themes.startify").config)
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim", "folke/trouble.nvim" },
    config = function()
      require("config.gitsigns").setup()
    end,
  },
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    event = "BufRead",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
      -- configurations go here
    },
  },
  {
    "akinsho/bufferline.nvim",
    version = "v3.*",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("config.bufferline").setup()
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
    end,
  },
  {
    "kyazdani42/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    cmd = { "NvimTreeToggle", "NvimTreeFocus", "NvimTreeFindFile", "NvimTreeClose" },
    config = function()
      require("config.nvim-tree").setup()
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = {
      "meuter/lualine-so-fancy.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      local components = require "config.statusline.components"

      require("lualine").setup {
        options = {
          icons_enabled = true,
          theme = "auto",
          component_separators = {},
          section_separators = {},
          disabled_filetypes = {
            statusline = { "alpha", "lazy", "fugitive", "" },
            winbar = {
              "help",
              "alpha",
              "lazy",
            },
          },
          always_divide_middle = true,
          globalstatus = true,
        },
        sections = {
          lualine_a = { { "fancy_mode", width = 3 } },
          lualine_b = { components.git_repo, "branch" },
          lualine_c = {
            { "fancy_cwd",        substitute_home = true },
            components.diff,
            { "fancy_diagnostics" },
            components.separator,
            components.lsp_client,
          },
          lualine_x = { "filename", components.spaces, "encoding", "fileformat", "filetype", "progress" },
          lualine_y = {},
          lualine_z = { "location" },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename" },
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {},
        },
        extensions = { "nvim-tree", "toggleterm", "quickfix" },
      }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      require("config.lsp").setup()
    end,
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "folke/lua-dev.nvim",
      "RRethy/vim-illuminate",
      "jose-elias-alvarez/null-ls.nvim",
      {
        "j-hui/fidget.nvim",
        tag = "legacy",
        config = function()
          require("fidget").setup({})
        end,
      },
      "jose-elias-alvarez/typescript.nvim",
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ':TSUpdate',
    event = 'VeryLazy',
    config = function()
      require("config.treesitter").setup()
    end,
    dependencies = {
      { "nvim-treesitter/nvim-treesitter-textobjects" },
      { "nvim-treesitter/playground" },
    },
  },
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    config = function()
      require("trouble").setup({
        use_diagnostic_signs = true,
      })
    end,
  },
  {
    "ahmedkhalf/project.nvim",
    lazy = false,
    config = function()
      require("config.project").setup()
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("config.telescope").setup()
    end,
    cmd = "Telescope",
    dependencies = {
      "ahmedkhalf/project.nvim",
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
      "otavioschwanck/telescope-alternate",
      "nvim-telescope/telescope-fzy-native.nvim",
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      "nvim-telescope/telescope-live-grep-args.nvim",
      "folke/trouble.nvim",
    },
  },
  { "BurntSushi/ripgrep", lazy = false },
  { "vim-test/vim-test",  lazy = false },
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup {}
    end,
    event = "VeryLazy"
  },
}
