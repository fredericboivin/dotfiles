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



"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

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

highlight CocHighlightText ctermfg=231 guifg=#ffffff ctermbg=60 guibg=#d65d0e

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
colorscheme onedark
let g:airline_theme='onedark'


" Airline
let g:airline_powerline_fonts = 0
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

