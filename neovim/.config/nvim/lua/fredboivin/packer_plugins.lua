return {
  {
    'lewis6991/impatient.nvim',
    lazy = false,
  },
  {
    "tpope/vim-fugitive",
    event = "VeryLazy",
  },
  {
    "tpope/vim-sensible",
    event = "VeryLazy",
  },
  {
    'github/copilot.vim',
    event = "VeryLazy"
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
  "ThePrimeagen/harpoon",
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
    config = function()
      vim.cmd [[colorscheme tokyonight-storm]]
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
      require("gitsigns").setup()
    end,
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
    event = "VimEnter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("config.lualine").setup()
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
      "nvim-telescope/telescope-fzy-native.nvim",
      "nvim-telescope/telescope-live-grep-args.nvim",
      "folke/trouble.nvim",
    },
  },
  { "BurntSushi/ripgrep", lazy = false },
  { "vim-test/vim-test",  lazy = false },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-python",
      "nvim-neotest/neotest-plenary",
      "nvim-neotest/neotest-go",
      "haydenmeade/neotest-jest",
      "nvim-neotest/neotest-vim-test",
    },
    config = function()
      require("config.neotest").setup()
    end,
  }
}
