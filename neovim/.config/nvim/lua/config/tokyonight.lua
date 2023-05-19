local M = {}

function M.setup()
  require('tokyonight').setup({
    style = 'moon',
    transparent = false,
    commentStyle = 'italic',
    keywordStyle = 'italic',
    functionStyle = 'italic',
    variableStyle = 'italic',
    hideInactiveStatusline = true,
    sidebars = { 'qf', 'vista_kind', 'terminal', 'packer' },
    on_highlights = function(hl, c)
      local prompt = "#2d3149"
      hl.TelescopeNormal = {
        bg = c.bg_dark,
        fg = c.fg_dark,
      }
      hl.TelescopeBorder = {
        bg = c.bg_dark,
        fg = c.bg_dark,
      }
      hl.TelescopePromptNormal = {
        bg = prompt,
      }
      hl.TelescopePromptBorder = {
        bg = prompt,
        fg = prompt,
      }
      hl.TelescopePromptTitle = {
        bg = prompt,
        fg = prompt,
      }
      hl.TelescopePreviewTitle = {
        bg = c.bg_dark,
        fg = c.bg_dark,
      }
      hl.TelescopeResultsTitle = {
        bg = c.bg_dark,
        fg = c.bg_dark,
      }
    end,
  })
end

return M
