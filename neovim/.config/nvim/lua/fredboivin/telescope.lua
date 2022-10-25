local actions = require("telescope.actions")
local previewers = require("telescope.previewers")

require('telescope').setup{
  defaults = {
    file_ignore_patterns = {"package-lock.json", "wdio/*"},
    -- path_display={"smart"},
    -- layout_strategy = "bottom_pane",
    -- layout_config = {
    --    bottom_pane = {height = 0.9, prompt_position = "bottom"},
    -- },

    prompt_prefix = " ",
    selection_caret = "❯ ",
    path_display = { "truncate" },
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.5,
        results_width = 0.5,
      },
      vertical = {
        mirror = false,
      },
      width = 0.99,
      height = 0.99,
      preview_cutoff = 120,
    },

    file_previewer = previewers.vim_buffer_cat.new,
    grep_previewer = previewers.vim_buffer_vimgrep.new,
    qflist_previewer = previewers.vim_buffer_qflist.new,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-u>"] = false,
        -- ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}

-- require('telescope').load_extension('fzf')
require('telescope').load_extension('fzy_native')
require("telescope").load_extension("live_grep_args")
-- require'alpha'.setup(require'alpha.themes.dashboard'.config)
