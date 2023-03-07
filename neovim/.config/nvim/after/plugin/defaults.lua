local api = vim.api
local g = vim.g
local opt = vim.opt

opt.termguicolors = true
opt.timeoutlen = 300 --	Time in milliseconds to wait for a mapped sequence to complete.
opt.hlsearch = true -- Highlight all matches on previous search pattern.
opt.clipboard = "unnamedplus"

-- let g:coq_settings = { "keymap.jump_to_mark": "" }
