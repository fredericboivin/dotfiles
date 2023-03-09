local M = {}

function M.setup()
  require("bufferline").setup {
    options = {
      numbers = "none",
      diagnostics = "nvim_lsp",
      separator_style = "slant" or "padded_slant",
      show_tab_indicators = true,
      show_buffer_close_icons = false,
      show_close_icon = false,
      groups = {
        options = {
          toggle_hidden_on_enter = true -- when you re-enter a hidden group this options re-opens that group so the buffer is visible
        },
        items = {
          {
            name = "Tests",                                -- Mandatory
            highlight = { underline = true, sp = "blue" }, -- Optional
            priority = 2,                                  -- determines where it will appear relative to other groups (Optional)
            icon = "",                                  -- Optional
            matcher = function(buf)                        -- Mandatory
              return buf.filename:match('%_test') or buf.filename:match('%.spec.ts') or buf.filename:match('%.spec.tsx')
            end,
          },
          {
            name = "Docs",
            highlight = { undercurl = true, sp = "green" },
            auto_close = false, -- whether or not close this group if it doesn't contain the current buffer
            matcher = function(buf)
              return buf.filename:match('%.md') or buf.filename:match('%.txt')
            end,
            separator = { -- Optional
              style = require('bufferline.groups').separator.tab
            },
          }
        }
      }
    },
  }
end

return M
