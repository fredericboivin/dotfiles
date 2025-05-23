local M = {}

function M.setup()
  local telescope = require("telescope")
  local actions = require("telescope.actions")
  local action_layout = require("telescope.actions.layout")
  local trouble = require("trouble.providers.telescope")

  telescope.setup({
    defaults = {
      selection_strategy = "reset",
      file_ignore_patterns = { "^vendor/", "^sorbet/",  },
      sorting_strategy = "ascending",
      layout_strategy = "vertical",
      layout_config = {
        prompt_position = "bottom",
        horizontal = {
          -- prompt_position = "top",
          -- preview_width = 0.5,
          -- results_width = 0.5,
        },
        vertical = {
          -- preview_height = 0.9,
          mirror = false,
        },
        width = 0.99,
        height = 0.99,
        preview_cutoff = 1,
        -- preview_cutoff = 120,
      },
      mappings = {
        -- i = {
        --   ["<C-j>"] = actions.move_selection_next,
        --   ["<C-k>"] = actions.move_selection_previous,
        --   ["<C-n>"] = actions.cycle_history_next,
        --   ["<C-p>"] = actions.cycle_history_prev,
        --   ["<C-h>"] = action_layout.toggle_preview,
        --   ["<c-z>"] = trouble.open_with_trouble,
        -- },
        i = {
          ["<C-n>"] = actions.move_selection_next,
          ["<C-p>"] = actions.move_selection_previous,

          ["<C-c>"] = actions.close,

          ["<Down>"] = actions.move_selection_next,
          ["<Up>"] = actions.move_selection_previous,

          ["<C-h>"] = action_layout.toggle_preview,
          ["<c-z>"] = trouble.open_with_trouble,

          ["<CR>"] = actions.select_default,
          ["<C-x>"] = actions.select_horizontal,
          ["<C-v>"] = actions.select_vertical,
          ["<C-t>"] = actions.select_tab,

          ["<C-u>"] = actions.preview_scrolling_up,
          ["<C-d>"] = actions.preview_scrolling_down,

          ["<PageUp>"] = actions.results_scrolling_up,
          ["<PageDown>"] = actions.results_scrolling_down,

          ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
          ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
          ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
          ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          ["<C-l>"] = actions.complete_tag,
          ["<C-/>"] = actions.which_key,
          ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
          ["<C-w>"] = { "<c-s-w>", type = "command" },

          -- disable c-j because we dont want to allow new lines #2123
          ["<C-j>"] = actions.nop,
        },
        n = {
          ["<esc>"] = actions.close,
          ["<CR>"] = actions.select_default,
          ["<C-x>"] = actions.select_horizontal,
          ["<C-v>"] = actions.select_vertical,
          ["<C-t>"] = actions.select_tab,

          ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
          ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
          ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
          ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

          -- TODO: This would be weird if we switch the ordering.
          ["j"] = actions.move_selection_next,
          ["k"] = actions.move_selection_previous,
          ["H"] = actions.move_to_top,
          ["M"] = actions.move_to_middle,
          ["L"] = actions.move_to_bottom,

          ["<Down>"] = actions.move_selection_next,
          ["<Up>"] = actions.move_selection_previous,
          ["gg"] = actions.move_to_top,
          ["G"] = actions.move_to_bottom,

          ["<C-u>"] = actions.preview_scrolling_up,
          ["<C-d>"] = actions.preview_scrolling_down,

          ["<PageUp>"] = actions.results_scrolling_up,
          ["<PageDown>"] = actions.results_scrolling_down,

          ["?"] = actions.which_key,
        },
      },
      preview = {
        hide_on_startup = true,
      },
    },
    pickers = {
      buffers = {
        mappings = {
          i = {
            ['<c-d>'] = require('telescope.actions').delete_buffer
          }
        }
      },
      lsp_references = {
        fname_width = 200
      },
    },
    extensions = {
      ["telescope-alternate"] = {
        presets = { "rails", "rspec" },
        mappings = {
          {
            "components/(.*)/app/.*/(.*).rb",
            {
              { "components/[1]/test/**/[2]_test.rb", "Test" },
            },
          },
          {
            "components/(.*)/test/.*/(.*)_test.rb",
            {
              { "components/[1]/app/controllers/**/[2].rb", "Controller" },
              { "components/[1]/app/models/**/[2].rb",      "Model" },
            },
          },
          { "app/.*/(.*).rb", {
            { "test/**/[1]_test.rb", "Test" },
          } },
          { "test/.*/(.*)_test.rb", {
            { "app/**/[1].rb", "Implementation" },
          } },
          { "lib/.*/(.*).rb", {
            { "test/**/[1]_test.rb", "Test" },
          } },
          { "test/.*/(.*)_test.rb", {
            { "lib/**/[1].rb", "Implementation" },
          } },
          {
            "gems/(.*)/lib/.*/(.*).rb",
            {
              { "gems/[1]/test/**/[2]_test.rb", "Test" },
            },
          },
          {
            "gems/(.*)/test/.*/(.*)_test.rb",
            {
              { "gems/[1]/**/[2].rb", "Implementation" },
            },
          },
        },
      },
    },
  })

  -- telescope.load_extension "fzy_native"
  telescope.load_extension('fzf')
  telescope.load_extension 'projects'
  telescope.load_extension('telescope-alternate')
end

return M
