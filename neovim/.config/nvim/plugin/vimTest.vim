" Vim-test
let test#strategy = {
  \ 'nearest': 'neomake',
  \ 'file':    'neomake',
  \ 'suite':   'neomake',
\}

let g:test#javascript#runner = 'jest'
let test#javascript#runner = 'jest'

let test#javascript#jest#options = '--reporters ~/dotfiles/jestVimReporter/index.js'
" FAKE let g:test#javascript#jest#options = '--reporters ~/dotfiles/jestVimReporter/index.js'

let test#javascript#jest#executable = 'DYNAMIC_ENV=ci npx jest'
let g:test#javascript#jest#executable = 'DYNAMIC_ENV=ci npx jest'
let g:neomake_open_list = 2


let g:neomake_javascript_jest_maker = {
    \ 'exe': './node_modules/jest-cli/bin/jest.js',
    \ 'errorformat':
        \ '%f:%l:%c:%t:%m,' .
        \ '%-G%.%#'
    \ }

" set errorformat=%f\|%l\|%c,%f\|%l\|,%f\|\|
" set efm+=%f:%l:%c:%t:%m,%-G%.%#

set efm+=%.%#\ at\ %f:%l:%c,%.%#\ at\ %.%#(%f:%l:%c)
set efm+=%.%#\ at\ %.%#(%f:%l:%c),%-G%.%#

let g:neomake_javascript_enabled_makers = ['jest']
"let neomake_javascript_enabled_makers = ['jest']

let g:neomake_logfile = '/tmp/neomake.log'
"let neomake_open_list = 2
" let neomake_open_list = 3

" [vim-test]
" nmap <Leader>q :TestFile<CR>
" nmap <Leader>s :TestNearest<CR>
