lua require('config')
lua require('remaps')
lua require('git')
lua require('user_functions')

command! Scratch lua require'tools'.makeScratch()

map - ddp
map _ ddkP

let g:ale_linters = {
    \ 'sh': ['language_server'],
    \ }

let g:netwr_liststyle = 4

" set statusline=
" set statusline+=%F
" set statusline+=%l"
" 
" let g:currentmode={
"        \ 'n'  : 'NORMAL ',
"        \ 'v'  : 'VISUAL ',
"        \ 'V'  : 'V·Line ',
"        \ "\<C-V>" : 'V·Block ',
"        \ 'i'  : 'INSERT ',
"        \ 'R'  : 'R ',
"        \ 'Rv' : 'V·Replace ',
"        \ 'c'  : 'Command ',
"        \}
" 
" set statusline+=\ %{toupper(g:currentmode[mode()])}
" set statusline+=%{&modified?'[+]':''}
" set statusline+=%-7([%{&fileformat}]%)
"
"
