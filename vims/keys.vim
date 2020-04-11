
"*****************************************************************************
"" Mappings
"*****************************************************************************

" remap space to disable the highlights
nnoremap <space> :nohlsearch<CR> 	

" to search the highlighted text
vnoremap // y/<C-R>"<CR>"


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

" <F9> to quit Vim
nnoremap <F9> <esc>:qa<CR>

" <F10> to close current window
nnoremap <F10> <esc>:q<CR>

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

