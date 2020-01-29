let &t_Co=256

colorscheme desert

set nocompatible              " required
" Set the window size if the editor is running in Windows
if has('win32')
    set lines=40 columns=120
endif

" enable syntax highlighting
syntax enable
syntax on
set showcmd

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType yml setlocal ts=2 sts=2 sw=2 expandtab

set autoread		" Read the file again automatically if it has changed from outside Vim
set backspace=indent,eol,start  " Fix backspace indent

set fileformat=unix " Set the file format to unix EOL

let mapleader=','   " Map leader to , 
set laststatus=2
set background=dark

set number          " show line numbers
set relativenumber  " To display line numbers relative to the line with the cursor, use:

set hidden          " Set hidden to allow buffers to be browsed


set tabstop=4       " set tabs to have 4 spaces
set expandtab       " expand tabs into spaces
set shiftwidth=4    " when using the >> or << commands, shift lines by 4 spaces

set autoindent      " indent when moving to the next line while writing code

set incsearch       " jump to the search string as soon as we type
set hlsearch        " Highlight search results
set ignorecase      " set ignore case by default
set smartcase       " Do not ignorecase when search term is Capitalized
set gdefault 		" set the global search by default

" use the UTF-8 encoding standard
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary

"Mouse interferes with the copying/pasting
"set mouse=a 		" enable mouse in all modes. You can select and move around using mouse
"set mousemodel=popup " Mouse right click opens a popup instead of extending selection 

set cursorline 		" show a visual line under the cursor's current line

set showmatch 		" show the matching part of the pair for [] {} and ()

set title 			" set the title of the window or teminal to the current file
set titleold="Terminal" 
set titlestring=%F	" Set title string to be the file name

set wildignore+=**/node_modules/**

"*****************************************************************************
"" Mappings
"*****************************************************************************

" remap space to disable the highlights
nnoremap <space> :nohlsearch<CR> 	

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" Ctrl-F will move the cursor to end of line
inoremap <C-f> <End>

" To jump to the next line
inoremap <C-J> <End><CR> 

inoremap jj <Esc>:

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" remap F8 to reformatt the entire file
map <F8> mzgg=G`z

" Remap control keys for swapping windows
map <C-j> <C-w><C-j> 
map <C-k> <C-w><C-k> 
map <C-l> <C-w><C-l> 
map <C-h> <C-w><C-h> 

" terminal emulation
if has('nvim')
	nnoremap <silent> <leader>sh :terminal<CR>
endif

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" for easier navigation of buffers
nnoremap <silent> <Tab> :bn<CR>
nnoremap <silent> <S-Tab> :bp<CR>
nnoremap <silent> <S-t> :enew<CR>

" <F4> to delete the current buffer.
nnoremap <F4> :bdelete<CR>

" Quick Buffer switch mappings {{{
" The idea is to press <leader> and then the number from normal mode to switch
" e.g. `,2` would switch to the second buffer (listed at the top of the airline strip
"  
":nnoremap <silent> <Leader> :<C-u>try \| execute "b" . v:count \| catch \|  endtry<CR>
for i in range(1, 10)
    execute printf('nnoremap <Leader>%d :%db<CR>', i, i)
endfor
for i in range(1, 10)
    execute printf('nnoremap <Leader>d%d :bdelete %d<CR>', i, i)
endfor
" }}}


" to search the highlighted text
vnoremap // y/<C-R>"<CR>"

if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif


