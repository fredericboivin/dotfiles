" lua ./neovim/.config/nvim/lua/fredboivin/
" vimscript ./neovim/.config/nvim/plugin/
"
" onedark
set nocompatible

lua require('fredboivin')

set rtp+=/usr/local/opt/fzf
"set shell=bash

filetype plugin indent on
syntax on

set backspace=2
set cursorline
set title

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

" let g:fzf_preview_window = 'right:60%'

imap jj <Esc>

" Open Vim configuration file for editing
nnoremap <silent><leader>1 :e ~/dotfiles/neovim/.config/nvim/init.vim<CR>


"nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
"nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
"nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
"nnoremap <silent> <c-l> :TmuxNavigateRight<cr>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" NERDTree
let g:NERDTreeWinSize=50
let NERDTreeShowHidden=1

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

function! RemoveQFItem()
  let curqfidx = line('.') - 1
  let qfall = getqflist()
  call remove(qfall, curqfidx)
  call setqflist(qfall, 'r')
  execute curqfidx + 1 . "cfirst"
  :copen
endfunction
:command! RemoveQFItem :call RemoveQFItem()
" Use map <buffer> to only map dd in the quickfix window. Requires +localmap
autocmd FileType qf map <buffer> dd :RemoveQFItem<cr>

nmap <leader>pi :PlugInstall<CR>
nmap <leader>pc :PlugClean<CR>

" Copy current file path to clipboard
nnoremap <leader>% :call CopyCurrentFilePath()<CR>
nnoremap <leader>cp :call CopyLinkToCurrentFilePath()<CR>

function! CopyCurrentFilePath()
  let @+ = expand('%')
  echo @+
endfunction

augroup cdpwd
    autocmd!
    autocmd VimEnter * cd $PWD
augroup END

function! CopyLinkToCurrentFilePath()
    let absolute_path = $PWD . '/' . expand('%')
    let cursor_pos = getpos(".")
    let cursor_line = cursor_pos[1]

    let @+ = '{@ ' . absolute_path . " +" . cursor_line . '}'
    echo @+
endfunction

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
"let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
"let g:fzf_action = {
"  \ 'ctrl-q': function('s:build_quickfix_list'),
"  \ 'ctrl-l': function('s:build_location_list'),
"  \ 'ctrl-t': 'tab split',
"  \ 'ctrl-x': 'split',
"  \ 'ctrl-v': 'vsplit' }

" Custom things
" nnoremap <Leader>e :e <C-R>=expand('%:p:h') . '/'<CR>
" nnoremap <leader>r :FZF<CR>
" nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>fr <cmd>Telescope find_files hidden=true<cr>

" ================== Custom Functions ===================== "

" Trim Whitespaces
function! TrimWhitespace()
    let l:save = winsaveview()
    %s/\\\@<!\s\+$//e
    call winrestview(l:save)
endfunction

let g:tmux_navigator_no_mappings = 1

nmap <leader>w <cmd>w<CR>
nmap <leader>q <cmd>q<CR>
nmap <leader>h <cmd>nohlsearch<CR>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
" nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fg :lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>

autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
autocmd FileType typescript setlocal formatprg=prettier\ --parser\ typescript
autocmd BufWritePre * silent! call TrimWhitespace()
autocmd BufWritePre *.{ts,tsx} :silent EslintFixAll

nmap <leader>oq :copen<cr>
nmap <leader>ol :lopen<cr>

nnoremap [q :cprevious<CR>
nnoremap ]q :cnext<CR>
nnoremap [Q :cfirst<CR>
nnoremap ]Q :clast<CR>

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
" if (empty($TMUX))
"   if (has("nvim"))
"     "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
"     " let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"   endif
"   "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"   "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
"   " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
"   if (has("termguicolors"))
"     set termguicolors
"   endif
" endif
"
" Theme settings
"
" === Dark Theme ===
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
if (has("termguicolors"))
  set termguicolors
endif
" set background=dark
" colorscheme onedark

set scrolljump=5
set lazyredraw
set ttyfast
set updatetime=300
:set nohlsearch

" Copilot
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true
