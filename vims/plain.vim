let &t_Co=256

colorscheme pablo

set nocompatible              " required

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
set smarttab		" Will insert and delete based on tabstops.
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
set nrformats-=octal " Do not treat numbers starting with 0 as octal"

set cursorline 		" show a visual line under the cursor's current line

set showmatch 		" show the matching part of the pair for [] {} and ()

set title 			" set the title of the window or teminal to the current file
set titleold="Terminal" 
set titlestring=%F	" Set title string to be the file name

set wildignore+=**/node_modules/**

