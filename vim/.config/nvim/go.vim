" Settings for Go related stuff

au FileType go map <F1> :GoDoc<enter>
au FileType go map <F8> :GoFmt<enter>

set updatetime=100
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_alternate_mode = "vsplit"

let $GOPATH = $GOPATH
let g:go_fmt_command = "goimports"
set wildignore+=**/vendor/**
