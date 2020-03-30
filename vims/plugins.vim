""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('nvim')
	let s:editor_root=expand("~/.local/share/nvim/site")
else
    let s:editor_root=expand("~/.vim")
endif

" Setting up VimPlug - the vim plugin bundler
let vimplug_installed=1
let vimplug_vim=s:editor_root . '/autoload/plug.vim'

if !filereadable(vimplug_vim)
    echo "Installing vimplug.."
    echo ""
    silent execute "!curl -fLo " . s:editor_root . "/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    let vimplug_installed=0
endif

" set the runtime path to include vimplug and initialize
call plug#begin(s:editor_root . '/plugged')


Plug 'ctrlpvim/ctrlp.vim'
Plug 'Raimondi/delimitMate'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

if executable('rg')
  Plug 'mileszs/ack.vim'
  let g:ackprg = 'rg --vimgrep'
endif

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

if has('nvim')
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go' }
Plug 'tpope/vim-fugitive'


" All of your Plugins must be added before the following line
call plug#end()            " required
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if vimplug_installed == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :PlugInstall
endif


