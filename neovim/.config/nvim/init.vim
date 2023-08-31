set nocompatible

lua require('fredboivin')

" set rtp+=/usr/local/opt/fzf

filetype plugin indent on
" syntax on

set backspace=2
set cursorline
set title " Set the title of the window to the current file
set number " Show line number in the gutter

set splitbelow
set splitright

set noswapfile
set nobackup
set noerrorbells visualbell t_vb=
set belloff=all
" set expandtab
set ignorecase
" set autoindent
" set smartindent
" set softtabstop=2
" set shiftwidth=2
set updatetime=300

" set wildignore+=*/tmp/*,*/.git/*,*/vendor/bundle/*,*/build/*

imap jj <Esc>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Copy current file path to clipboard
nnoremap <leader>% :call CopyCurrentFilePath()<CR>
nnoremap <leader>cp :call CopyLinkToCurrentFilePath()<CR>

function! CopyCurrentFilePath()
  let @+ = expand('%')
  echo @+
endfunction

function! CopyLinkToCurrentFilePath()
    let absolute_path = $PWD . '/' . expand('%')
    let cursor_pos = getpos(".")
    let cursor_line = cursor_pos[1]

    let @+ = '{@ ' . absolute_path . " +" . cursor_line . '}'
    echo @+
endfunction

" nnoremap <Leader>fr <cmd>Telescope find_files hidden=true<cr>

" ================== Custom Functions ===================== "

" Trim Whitespaces
function! TrimWhitespace()  
    let l:save = winsaveview()
    %s/\\\@<!\s\+$//e
    call winrestview(l:save)
endfunction

nmap <leader>w <cmd>w<CR>
nmap <leader>q <cmd>q<CR>
nmap <leader>h <cmd>:call TrimWhitespace()<CR>

set scrolljump=5
set lazyredraw
set ttyfast
set updatetime=300

let g:fzf_layout = { 'window': { 'width': 1, 'height': 1 } }
let g:fzf_preview_window = 'down:40%'

autocmd BufReadPost fugitive://* set bufhidden=delete
let test#strategy = "toggleterm"
let test#neovim#term_position = "horizontal"
let g:test#neovim#start_normal = 1
" Copilot
" map <silent><script><expr> <C-J> copilot#Accept("\<CR>")
" let g:copilot_no_tab_map = v:true
