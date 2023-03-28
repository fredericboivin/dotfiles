local api = vim.api
local g = vim.g
local opt = vim.opt

opt.termguicolors = true  
opt.timeoutlen = 300 --	Time in milliseconds to wait for a mapped sequence to complete.
opt.hlsearch = true -- Highlight all matches on previous search pattern.
opt.clipboard = "unnamedplus"

 vim.cmd [[
   augroup YankHighlight
     autocmd!
     autocmd TextYankPost * silent! lua vim.highlight.on_yank()
   augroup end
 ]]

vim.api.nvim_create_user_command('Redir', function(ctx)
  local lines = vim.split(vim.api.nvim_exec(ctx.args, true), '\n', { plain = true })
  vim.cmd('new')
  vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
  vim.opt_local.modified = false
end, { nargs = '+', complete = 'command' })

-- let g:coq_settings = { "keymap.jump_to_mark": "" }
