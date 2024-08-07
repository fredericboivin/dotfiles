return {
  {
    'jpalardy/vim-slime',
    lazy = false,
    enabled = false
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
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("cyberdream").setup({
        -- Enable transparent background
        borderless_telescope = true,
        transparent = true,
        terminal_colors = true,
      })
      vim.cmd("colorscheme cyberdream")
    end
  },
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    lazy = false,
    config = function()
      require 'config.toggleterm'
    end,
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
    "folke/which-key.nvim",
    lazy = false,
    config = function()
      require("config.whichkey").setup()
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
    "windwp/windline.nvim",
    event = "VeryLazy",
    config = function()
      require("wlsample.evil_line")
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
      { "RRethy/nvim-treesitter-endwise" }
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
  {
    'stevearc/aerial.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons"
    },
    event = "VeryLazy",
    config = function()
      require("aerial").setup({
        -- optionally use on_attach to set keymaps when aerial has attached to a buffer
        on_attach = function(bufnr)
          -- Jump forwards/backwards with '{' and '}'
          vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
          vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
        end,
      })
    end,
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    -- stylua: ignore
    keys = {
      { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
      { "S",     mode = { "n", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
      { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    },
  }
}
