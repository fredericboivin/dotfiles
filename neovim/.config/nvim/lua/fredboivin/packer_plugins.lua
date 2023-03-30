local M = {}

function M.setup()
  -- Indicate first time installation
  local is_boostrap = false

  -- packer.nvim configuration
  local conf = {
    profile = {
      enable = true,
      threshold = 1, -- the amount in ms that a plugins load time must be over for it to be included in the profile
    },
    display = {
      open_fn = function()
        return require("packer.util").float({ border = "rounded" })
      end,
    },
  }

  -- Check if packer.nvim is installed
  -- Run PackerCompile if there are changes in this file
  -- local function packer_init()
  --   local fn = vim.fn
  --   local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
  --   if fn.empty(fn.glob(install_path)) > 0 then
  --     fn.system {
  --       "git",
  --       "clone",
  --       "--depth",
  --       "1",
  --       "https://github.com/wbthomason/packer.nvim",
  --       install_path,
  --     }
  --     is_boostrap = true
  --     vim.cmd [[packadd packer.nvim]]
  --   end

  --   -- Run PackerCompile if there are changes in this file
  --   -- vim.cmd "autocmd BufWritePost plugins.lua source <afile> | PackerCompile"
  --   local packer_grp = vim.api.nvim_create_augroup("packer_user_config", { clear = true })
  --   vim.api.nvim_create_autocmd(
  --   { "BufWritePost" },
  --   { pattern = vim.fn.expand "$MYVIMRC", command = "source <afile> | PackerCompile", group = packer_grp }
  --   )
  -- end

  local function packer_init()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
      packer_bootstrap = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
      })
      vim.cmd([[packadd packer.nvim]])
    end
    vim.cmd("autocmd BufWritePost packer_plugins.lua source <afile> | PackerCompile")
  end

  -- Plugins
  local function plugins(use)
    use({ "wbthomason/packer.nvim" })

    -- Load only when require
    use({ "nvim-lua/plenary.nvim", module = "plenary" })

    use({ "tpope/vim-fugitive" })
    use({
      "ThePrimeagen/harpoon",
      config = function()
        require("config.harpoon").setup()
      end,
    })

    use({ "tpope/vim-sensible" })
    -- use { 'tpope/vim-unimpaired' }
    -- use { 'tpope/vim-surround' }

    use({
      "rcarriga/nvim-notify",
      event = "VimEnter",
      config = function()
        vim.notify = require("notify")
      end,
    })

    -- Performance
    use({ "lewis6991/impatient.nvim" })

    use({
      "stevearc/dressing.nvim",
      config = function()
        require("config.dressing").setup()
      end,
    })

    -- Colorscheme
    use({
      "sainnhe/everforest",
      config = function()
        -- vim.g.termguicolors = true
        -- vim.g.everforest_better_performance = 1
        vim.g.everforest_enable_italic = 1
        vim.g.everforest_background = "hard"
        vim.cmd("colorscheme everforest")
      end,
    })

    -- IndentLine
    use({
      "lukas-reineke/indent-blankline.nvim",
      event = "BufReadPre",
      config = function()
        require("config.indentblankline").setup()
      end,
    })
    -- WhichKey
    use({
      "folke/which-key.nvim",
      event = "VimEnter",
      config = function()
        require("config.whichkey").setup()
      end,
    })

    -- Startup screen
    use({
      "goolord/alpha-nvim",
      requires = { "nvim-tree/nvim-web-devicons" },
      config = function()
        require("alpha").setup(require("alpha.themes.startify").config)
      end,
    })

    use({
      "lewis6991/gitsigns.nvim",
      event = "BufReadPre",
      wants = "plenary.nvim",
      requires = { "nvim-lua/plenary.nvim", "folke/trouble.nvim" },
      config = function()
        require("gitsigns").setup()
      end,
    })

    use({
      "akinsho/bufferline.nvim",
      tag = "v3.*",
      requires = "nvim-tree/nvim-web-devicons",
      config = function()
        require("config.bufferline").setup()
      end,
    })

    use({
      "kyazdani42/nvim-tree.lua",
      requires = {
        "nvim-tree/nvim-web-devicons",
      },
      cmd = { "NvimTreeToggle", "NvimTreeFocus", "NvimTreeFindFile", "NvimTreeClose" },
      config = function()
        require("config.nvim-tree").setup()
      end,
    })

    -- Status line
    use({
      "nvim-lualine/lualine.nvim",
      after = "nvim-treesitter",
      config = function()
        require("config.lualine").setup()
      end,
      wants = "nvim-web-devicons",
    })

    -- Completion
    -- use {
    --   "ms-jpq/coq_nvim",
    --   opt = true,
    --   event = "InsertEnter",
    --   branch = "coq",
    --   run = ":COQdeps",
    --   config = function()
    --     require("config.coq").setup()
    --   end,
    --   requires = {
    --     { "ms-jpq/coq.artifacts",  branch = "artifacts" },
    --     { "ms-jpq/coq.thirdparty", branch = "3p",       module = "coq_3p" },
    --   },
    --   disable = false,
    -- }

    -- LSP
    use({
      "neovim/nvim-lspconfig",
      -- opt = true,
      -- event = "BufReadPre",
      wants = { "null-ls.nvim", "mason.nvim", "coq_nvim", "typescript.nvim" },
      config = function()
        require("config.lsp").setup()
      end,
      requires = {
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
    })

    -- Treesitter
    use({
      "nvim-treesitter/nvim-treesitter",
      opt = true,
      event = "BufRead",
      run = ":TSUpdate",
      config = function()
        require("config.treesitter").setup()
      end,
      requires = {
        { "nvim-treesitter/nvim-treesitter-textobjects" },
        { "nvim-treesitter/playground" },
      },
    })
    -- trouble.nvim
    use({
      "folke/trouble.nvim",
      module = { "trouble.providers.telescope" },
      cmd = { "TroubleToggle", "Trouble" },
      config = function()
        require("trouble").setup({
          use_diagnostic_signs = true,
        })
      end,
    })

    use({
      "nvim-telescope/telescope.nvim",
      event = { "VimEnter" },
      config = function()
        require("config.telescope").setup()
      end,
      wants = {
        "trouble.nvim",
        "plenary.nvim",
        "popup.nvim",
        "telescope-fzy-native.nvim",
        -- "telescope-repo.nvim",
        -- "telescope-file-browser.nvim",
        "project.nvim",
      },
      requires = {
        "nvim-lua/popup.nvim",
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-fzy-native.nvim",
        -- "nvim-telescope/telescope-project.nvim",
        -- "cljoly/telescope-repo.nvim",
        -- "nvim-telescope/telescope-file-browser.nvim",
        {
          "ahmedkhalf/project.nvim",
          config = function()
            require("config.project").setup()
          end,
        },
      },
    })

    use({ "BurntSushi/ripgrep" })

    -- lspsaga.nvim
    -- use({
    --   "glepnir/lspsaga.nvim",
    --   branch = "main",
    --   config = function()
    --     require("lspsaga").setup({})
    --   end,
    --   requires = {
    --     {"nvim-tree/nvim-web-devicons"},
    --     --Please make sure you install markdown and markdown_inline parser
    --     {"nvim-treesitter/nvim-treesitter"}
    --   }
    -- })

    -- use {
    --   "ahmedkhalf/project.nvim",
    --   config = function()
    --     require("project_nvim").setup {
    --       detection_methods = { "pattern", "lsp" },
    --       patterns = { ".git" },
    --       -- your configuration comes here
    --       -- or leave it empty to use the default settings
    --       -- refer to the configuration section below
    --     }
    --   end
    -- }

    -- https://github.com/WhoIsSethDaniel/toggle-lsp-diagnostics.nvim
    -- https://github.com/rbong/vim-buffest
    -- https://github.com/jamestthompson3/nvim-remote-containers
    -- https://github.com/esensar/nvim-dev-container
    -- https://github.com/mrjones2014/smart-splits.nvim
    -- https://github.com/ziontee113/icon-picker.nvim
    -- https://github.com/rktjmp/lush.nvim
    -- https://github.com/charludo/projectmgr.nvim
    -- https://github.com/katawful/kreative
    -- https://github.com/kevinhwang91/nvim-ufo

    -- Bootstrap Neovim
    if is_boostrap then
      print("Neovim restart is required after installation!")
      require("packer").sync()
    end
  end

  -- Init and start packer
  packer_init()
  local packer = require("packer")

  -- Performance
  pcall(require, "impatient")
  -- pcall(require, "packer_compiled")

  packer.init(conf)
  packer.startup(plugins)
end

return M
