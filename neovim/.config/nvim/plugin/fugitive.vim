" nmap <leader>g [git-p]
" xmap <leader>g [git-p]
" 
" 
" nnoremap <silent> <leader>gp :Git push<cr>
" nnoremap <silent> <leader>gP :Git push --no-verify<cr>
" nnoremap <silent> <leader>gc :Git commit -n<cr>
" nnoremap <silent> <leader>ga :Git commit -n --amend<cr>
" " nnoremap <silent<leader>gp]C :Git commit -n<cr>
" nnoremap <silent> <leader>gs :vertical Git<cr>
" nnoremap <silent> <leader>gd :Gvdiff<cr>
" 
" " === Conflict Resolution ===
" nnoremap gdh :diffget //2<CR>
" nnoremap gdl :diffget //3<CR>
" 
" " === Diff highlight ===
" hi DiffDelete gui=NONE guifg=#6E0004 guibg=#6E0004
" hi DiffAdd gui=NONE guifg=NONE guibg=#19381C
" hi DiffChange ctermbg=237 guibg=#203C3D cterm=NONE gui=NONE guifg=NONE
" hi DiffText ctermbg=237 guibg=#26494A guifg=NONE
" 
" augroup fugitiveSettings
"     autocmd!
"     autocmd FileType gitcommit setlocal nolist
"     autocmd BufReadPost fugitive://* setlocal bufhidden=delete
" augroup END
