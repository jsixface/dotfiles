let $VIMRT=expand("$HOME/.config/nvim")

source $VIMRT/plain.vim
source $VIMRT/keys.vim
source $VIMRT/plugins.vim

source $VIMRT/airline.vim
"source $VIMRT/deoplete.vim
source $VIMRT/ultisnips.vim
source $VIMRT/ctrlp.vim

"Go related plugins
source $VIMRT/go.vim

try
    " Solarized options
    let g:solarized_term = 1
catch                                                                         
endtry

