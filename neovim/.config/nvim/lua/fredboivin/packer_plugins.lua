local M = {}

function M.setup()
  -- Indicate first time installation
  local is_boostrap = false

  -- packer.nvim configuration
  local conf = {
    profile = {
      enable = true,
      threshold = 0, -- the amount in ms that a plugins load time must be over for it to be included in the profile
    },

    display = {
      open_fn = function()
        return require("packer.util").float { border = "rounded" }
      end,
    },
  }

  -- Check if packer.nvim is installed
  -- Run PackerCompile if there are changes in this file
  local function packer_init()
    local fn = vim.fn
    local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
      fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
      }
      is_boostrap = true
      vim.cmd [[packadd packer.nvim]]
    end

    -- Run PackerCompile if there are changes in this file
    -- vim.cmd "autocmd BufWritePost plugins.lua source <afile> | PackerCompile"
    local packer_grp = vim.api.nvim_create_augroup("packer_user_config", { clear = true })
    vim.api.nvim_create_autocmd(
    { "BufWritePost" },
    { pattern = vim.fn.expand "$MYVIMRC", command = "source <afile> | PackerCompile", group = packer_grp }
    )
  end

  -- Plugins
  local function plugins(use)
    use { "wbthomason/packer.nvim" }

    -- Performance
    use { "lewis6991/impatient.nvim" }

     -- IndentLine
    use {
      "lukas-reineke/indent-blankline.nvim",
      event = "BufReadPre",
      config = function()
        require("config.indentblankline").setup()
      end,
    }
    -- WhichKey
    use {
      "folke/which-key.nvim",
      event = "VimEnter",
      config = function()
        require("config.whichkey").setup()
      end,
    }

    -- Startup screen
    use {
      "goolord/alpha-nvim",
      requires = { 'nvim-tree/nvim-web-devicons' },
      config = function()
        require'alpha'.setup(require'alpha.themes.startify'.config)
      end,
    }

    use {
      'lewis6991/gitsigns.nvim',
      config = function()
        require('gitsigns').setup()
      end
    }

    use {
      'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons',
      config = function()
        require('bufferline').setup()
      end
    }

    use {
      "kyazdani42/nvim-tree.lua",
      requires = {
        'nvim-tree/nvim-web-devicons'
      },
      cmd = { "NvimTreeToggle", "NvimTreeFindFile", "NvimTreeClose" },
      config = function()
        require("config.nvim-tree").setup()
      end,
    }

    -- Completion
    use {
      "ms-jpq/coq_nvim",
      branch = "coq",
      event = "InsertEnter",
      opt = true,
      run = ":COQdeps",
      config = function()
        require("config.coq").setup()
      end,
      requires = {
        { "ms-jpq/coq.artifacts", branch = "artifacts" },
        { "ms-jpq/coq.thirdparty", branch = "3p", module = "coq_3p" },
      },
      disable = false,
    }


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
      print "Neovim restart is required after installation!"
      require("packer").sync()
    end
  end

  -- Init and start packer
  packer_init()
  local packer = require "packer"

  -- Performance
  pcall(require, "impatient")
  -- pcall(require, "packer_compiled")

  packer.init(conf)
  packer.startup(plugins)
end

return M
