vim.g.deoplete_enable_at_startup = 1
vim.g['deoplete#sources#go#use_cache'] = 1

function _G.my_cr_function()
    return vim.fn.pumvisible() == 1 and '<C-y><CR>' or '<CR>'
end

vim.api.nvim_set_keymap('i', '<CR>', '<C-r>=v:lua.my_cr_function()<CR>', { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap('i', '<TAB>', 'pumvisible() ? "<C-n>" : "<TAB>"', { noremap = true, silent = false, expr = true })
