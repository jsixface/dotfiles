""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('nvim')
    if has('win32')
        let s:editor_root=expand("$LOCALAPPDATA/nvim/site")
    else
        let s:editor_root=expand("~/.local/share/nvim/site")
    endif
else
    let s:editor_root=expand("~/.vim")
endif

" Setting up Vundle - the vim plugin bundler
let vimplug_installed=1
let vimplug_vim=s:editor_root . '/autoload/plug.vim'
if !filereadable(vimplug_vim)
    echo "Installing vimplug.."
    echo ""
    silent execute "!curl -fLo " . s:editor_root . "/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    let vimplug_installed=0
endif

" set the runtime path to include vimplug and initialize
" let &rtp = &rtp . ',' . s:editor_root . '/bundle/vimplug/'
call plug#begin(s:editor_root . '/plugged')

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'ctrlpvim/ctrlp.vim'
Plug 'Raimondi/delimitMate'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

if has('nvim')
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'tpope/vim-fugitive'


" All of your Plugins must be added before the following line
call plug#end()            " required
filetype plugin indent on    " required
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if vimplug_installed == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :PlugInstall
endif

