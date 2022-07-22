set nocompatible

set rtp+=/usr/local/opt/fzf

call plug#begin()
Plug 'github/copilot.vim'
Plug 'ellisonleao/gruvbox.nvim'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'vim-ruby/vim-ruby'
Plug 'skywind3000/asyncrun.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'itchyny/lightline.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" Plug 'mxw/vim-jsx'
"Plug 'vim-test/vim-test'
Plug 'tpope/vim-dispatch'
Plug 'janko-m/vim-test'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'romgrk/winteract.vim'
call plug#end()

filetype plugin indent on
syntax on

set backspace=2
set cursorline

set noswapfile
set nobackup
set noerrorbells visualbell t_vb=
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

let g:coc_global_extensions = ['coc-tsserver']
let g:coc_global_extensions += ['coc-json']
let g:coc_global_extensions += ['coc-highlight']

let test#strategy = "dispatch"
let test#neovim#start_normal = 1

let g:test#javascript#runner = 'jest'
let test#javascript#runner = 'jest'

if !exists('g:test#javascript#jest#file_pattern')
  let test#javascript#jest#file_pattern = '\v(__tests__/.*|(spec|test))\.(js|jsx|coffee|ts|tsx)$'
endif
let test#javascript#jest#executable = 'npx jest --silent  --reporters ~/dotfiles/jestVimReporter/index.js'

imap jj <Esc>

" Open Vim configuration file for editing
nnoremap <silent><leader>1 :source ~/.config/nvim/init.vim<CR>
nnoremap <silent><leader>2 :e ~/dotfiles/neovim/.config/nvim/init.vim<CR>

set efm+=%E\ %#%f\ %#(%l\\\,%c):\ error\ TS%n:\ %m,%C%m

let g:asyncrun_open = 8

command! MakeTs AsyncRun npx tsc --noEmit -p $PWD
command! MakeEslintFile AsyncRun $PWD/node_modules/.bin/eslint -f unix %
command! MakeEslint AsyncRun $PWD/node_modules/.bin/eslint -f unix $PWD

" [vim-test]
map <Leader>q :TestFile<CR>
map <Leader>s :TestNearest<CR>

nmap <leader>ac  <Plug>(coc-codeaction)

nmap <leader>qf  <Plug>(coc-fix-current)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

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

nnoremap <silent> <space>s :<C-u>CocList -I symbols<cr>
xmap <leader>f  <Plug>(coc-format-selected)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" nnoremap <silent> K :call CocAction('doHover')<CR>

" function! ShowDocIfNoDiagnostic(timer_id)
 " if (coc#float#has_float() == 0 && CocHasProvider('hover') == 1)
 "   silent call CocActionAsync('doHover')
 " endif
" endfunction

"function! s:show_hover_doc()
"  call timer_start(100, 'ShowDocIfNoDiagnostic')
"endfunction

" nnoremap <silent> <space>s :<C-u>CocList -I symbols<cr>
autocmd CursorHold * silent call CocActionAsync('highlight')
" autocmd CursorHoldI * :call <SID>show_hover_doc()
" autocmd CursorHold * :call <SID>show_hover_doc()
" nmap <silent> <C-s> <Plug>(coc-range-select)
" xmap <silent> <C-s> <Plug>(coc-range-select)


"autocmd QuickFixCmdPost [^l]* nested cwindow
"autocmd QuickFixCmdPost    l* nested lwindow

" Add CoC ESLint if ESLint is installed
if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

" Add CoC Prettier if prettier is installed
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

" Format
nmap <leader>f   :CocCommand prettier.formatFile<CR>
function! QuickFix_toggle()
    for i in range(1, winnr('$'))
        let bnum = winbufnr(i)
        if getbufvar(bnum, '&buftype') == 'quickfix'
            cclose
            return
        endif
    endfor

    copen
endfunction

nnoremap <silent> <Leader>c :call QuickFix_toggle()<CR>
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

" Custom things
nnoremap <Leader>e :e <C-R>=expand('%:p:h') . '/'<CR>
nnoremap <leader>r :FZF<CR>
nnoremap <Leader>b :Buffers<CR>

augroup neomake_hook
  au!
  autocmd User NeomakeJobFinished call TestFinished()
  autocmd User NeomakeJobStarted call TestStarted()
augroup END

function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }


" initially empty status
let g:testing_status = ''

" Start test
function! TestStarted() abort
  let g:testing_status = 'Test ⌛'
endfunction

" Show message when all tests are passing
function! TestFinished() abort
  let context = g:neomake_hook_context
  if context.jobinfo.exit_code == 0
    let g:testing_status = 'Test ✅'
  endif
  if context.jobinfo.exit_code == 1
    let g:testing_status = 'Test ❌'
  endif
endfunction

function! TestStatus() abort
  return g:testing_status
endfunction

lua << EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true
  }
}
EOF

colorscheme gruvbox
nnoremap [q :cprevious<CR>
nnoremap ]q :cnext<CR>
nnoremap [Q :cfirst<CR>
nnoremap ]Q :clast<CR>
" [Lightline]
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'teststatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'teststatus': 'TestStatus'
      \ },
 \ }
