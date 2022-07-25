" lua ./neovim/.config/nvim/lua/fredboivin/
" vimscript ./neovim/.config/nvim/plugin/
"
set nocompatible

lua require('fredboivin')

set rtp+=/usr/local/opt/fzf

filetype plugin indent on
syntax on

set backspace=2
set cursorline

set splitbelow
set splitright

set noswapfile
set nobackup
set noerrorbells visualbell t_vb=
set belloff=all
set number
set expandtab
set ignorecase
set autoindent
set smartindent
set softtabstop=2
set shiftwidth=2
set updatetime=300

set wildignore+=*/tmp/*,*/.git/*,*/vendor/bundle/*,*/build/*

let g:fzf_preview_window = 'right:60%'

imap jj <Esc>

" Open Vim configuration file for editing
nnoremap <silent><leader>1 :source ~/.config/nvim/init.vim<CR>
nnoremap <silent><leader>2 :e ~/dotfiles/neovim/.config/nvim/init.vim<CR>


nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"autocmd QuickFixCmdPost [^l]* nested cwindow
"autocmd QuickFixCmdPost    l* nested lwindow


nmap <leader>w :InteractiveWindow<CR>

" [CoC] End
"
" NERDTree
:let g:NERDTreeWinSize=50
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

"highlight CocHighlightText ctermfg=231 guifg=#ffffff ctermbg=60 guibg=#d65d0e

" Functions
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

function! s:build_location_list(lines)
  call setloclist(0, map(copy(a:lines), '{ "filename": v:val }'))
  lopen
  ll
endfunction

" Settings
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-l': function('s:build_location_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Custom things
nnoremap <Leader>e :e <C-R>=expand('%:p:h') . '/'<CR>
nnoremap <leader>r :FZF<CR>
nnoremap <Leader>b :Buffers<CR>

" ================== Custom Functions ===================== "

" Trim Whitespaces
function! TrimWhitespace()
    let l:save = winsaveview()
    %s/\\\@<!\s\+$//e
    call winrestview(l:save)
endfunction


autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
autocmd FileType typescript setlocal formatprg=prettier\ --parser\ typescript
autocmd BufWritePre * silent! call TrimWhitespace()
autocmd BufWritePre *.{js,jsx,ts,tsx,cjs,mjs} :silent EslintFixAll

nmap <leader>oq :copen<cr>
nmap <leader>ol :lopen<cr>

nnoremap [q :cprevious<CR>
nnoremap ]q :cnext<CR>
nnoremap [Q :cfirst<CR>
nnoremap ]Q :clast<CR>
"
" Theme settings
"
" === Dark Theme ===
set background=dark
set termguicolors
colorscheme onedark
let g:airline_theme='onedark'


" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 0
let g:airline#themes#clean#palette = 1
call airline#parts#define_raw('linenr', '%l')
call airline#parts#define_accent('linenr', 'bold')
let g:airline_section_z = airline#section#create(['%3p%%  ',
            \ g:airline_symbols.linenr .' ', 'linenr', ':%c '])
let g:airline_section_warning = ''
let g:airline_highlighting_cache = 1
let g:airline#extensions#wordcount#enabled = 0
let g:airline#extensions#whitespace#enabled = 1

