" Vim-test
let test#strategy = {
  \ 'nearest': 'asyncrun',
  \ 'file':    'asyncrun_background',
  \ 'suite':   'asyncrun',
\}

let g:test#javascript#runner = 'jest'
let test#javascript#runner = 'jest'

let test#javascript#jest#options = '--reporters ~/dotfiles/jestVimReporter/index.js'
let g:test#javascript#jest#options = '--reporters ~/dotfiles/jestVimReporter/index.js'

let test#javascript#jest#executable = 'DYNAMIC_ENV=ci npx jest'
let g:test#javascript#jest#executable = 'DYNAMIC_ENV=ci npx jest'

" [vim-test]
nmap <Leader>q :TestFile<CR>
nmap <Leader>s :TestNearest<CR>
