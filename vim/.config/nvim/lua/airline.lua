if vim.g.airline_symbols == nil then
    vim.g.airline_symbols = {}
end

vim.g.airline_left_sep = '▶'
vim.g.airline_right_sep = '◀'
vim.g.airline_symbols.linenr = '‖'
vim.g.airline_symbols.branch = '⎇'
vim.g.airline_symbols.paste = 'ρ'
vim.g.airline_symbols.whitespace = 'Ξ'
vim.g['airline#extensions#branch#prefix']     = '⤴'
vim.g['airline#extensions#readonly#symbol']   = '⊘'
vim.g['airline#extensions#linecolumn#prefix'] = '¶'
vim.g['airline#extensions#paste#symbol']      = 'ρ'

vim.g.airline_theme="powerlineish"
vim.g['airline#extensions#branch#enabled'] = 1
vim.g['airline#extensions#tagbar#enabled'] = 1
vim.g.airline_skip_empty_sections = 1
vim.g['airline#extensions#tabline#left_alt_sep'] = '¦'
vim.g['airline#extensions#tabline#left_sep'] = '▶'
vim.g['airline#extensions#tabline#enabled'] = 1
vim.g['airline#extensions#tabline#buffer_nr_show'] = 1
vim.g['airline#extensions#tabline#fnamemod'] = ':t'
vim.g['airline#extensions#bufferline#enabled'] = 1
