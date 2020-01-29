" Settings for go-code deoplete-go
let g:deoplete#sources#go#gocode_binary = '~/go/bin/gocode'
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#go#use_cache = 1

" To make the selection from popup by <TAB> or <CR>
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
endfunction
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

