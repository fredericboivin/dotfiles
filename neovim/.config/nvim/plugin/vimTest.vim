" Vim-test
let test#strategy = {
  \ 'nearest': 'dispatch',
  \ 'file':    'dispatch',
  \ 'suite':   'dispatch',
\}

let g:test#javascript#runner = 'jest'
let test#javascript#runner = 'jest'

let test#javascript#jest#options = '--reporters ~/dotfiles/jestVimReporter/index.js'

let test#javascript#jest#executable = 'DYNAMIC_ENV=ci npx jest'
let g:test#javascript#jest#executable = 'DYNAMIC_ENV=ci npx jest'


" set errorformat=%f\|%l\|%c,%f\|%l\|,%f\|\|
" set efm+=%f:%l:%c:%t:%m,%-G%.%#

set efm+=%.%#\ at\ %f:%l:%c,%.%#\ at\ %.%#(%f:%l:%c)
set efm+=%.%#\ at\ %.%#(%f:%l:%c),%-G%.%#
autocmd FileType typescript let b:dispatch = './node_modules/jest/bin/jest %'

let g:dispatch_javascript_enabled_makers = ['jest']
"let dispatch_javascript_enabled_makers = ['jest']

" [vim-test]
" nmap <Leader>q :TestFile<CR>
" nmap <Leader>s :TestNearest<CR>
