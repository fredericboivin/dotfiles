local M = {}

function M.setup()
  local telescope = require("telescope")
  local actions = require("telescope.actions")
  local action_layout = require("telescope.actions.layout")
  local trouble = require("trouble.providers.telescope")
  local lga_actions = require("telescope-live-grep-args.actions")

  telescope.setup({
    defaults = {
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
      mappings = {
        i = {
          ["<C-j>"] = actions.move_selection_next,
          -- ["<C-k>"] = actions.move_selection_previous,
          ["<C-n>"] = actions.cycle_history_next,
          ["<C-p>"] = actions.cycle_history_prev,
          ["<C-h>"] = action_layout.toggle_preview,
          ["<c-z>"] = trouble.open_with_trouble,
        },
      },
    },
    pickers = {
      live_grep_args = {
        additional_args = function(opts)
          return { "--hidden" }
        end,
      },
    },
    extensions = {
      live_grep_args = {
        mappings = {
          i = {
            ["<C-k>"] = lga_actions.quote_prompt(),
          }
        }
      },
    },
  })

  telescope.load_extension "fzy_native"
  telescope.load_extension "live_grep_args"
  -- telescope.load_extension "repo"
  -- telescope.load_extension "file_browser"
  telescope.load_extension("projects") -- project.nvim
end

return M
