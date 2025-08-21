vim.api.nvim_set_keymap('n', '<space>', ':nohlsearch<CR>', { noremap = true, silent = false })
vim.api.nvim_set_keymap('v', '//', 'y/<C-R>"<CR>', { noremap = true, silent = false })

vim.api.nvim_set_keymap('n', 'n', 'nzzzv', { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', 'N', 'Nzzzv', { noremap = true, silent = false })

vim.api.nvim_set_keymap('i', '<C-f>', '<End>', { noremap = true, silent = false })
vim.api.nvim_set_keymap('i', '<C-J>', '<End><CR>', { noremap = true, silent = false })
vim.api.nvim_set_keymap('i', 'jj', '<Esc>:', { noremap = true, silent = false })

vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = false, silent = false })
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = false, silent = false })

vim.api.nvim_set_keymap('v', 'J', ':m ">+1<CR>gv=gv', { noremap = true, silent = false })
vim.api.nvim_set_keymap('v', 'K', ':m "><-2<CR>gv=gv', { noremap = true, silent = false })

vim.api.nvim_set_keymap('', '<F8>', 'mzgg=G`z', { noremap = false, silent = false })

vim.api.nvim_set_keymap('', '<C-j>', '<C-w><C-j>', { noremap = false, silent = false })
vim.api.nvim_set_keymap('', '<C-k>', '<C-w><C-k>', { noremap = false, silent = false })
vim.api.nvim_set_keymap('', '<C-l>', '<C-w><C-l>', { noremap = false, silent = false })
vim.api.nvim_set_keymap('', '<C-h>', '<C-w><C-h>', { noremap = false, silent = false })

if vim.fn.has('nvim') == 1 then
  vim.api.nvim_set_keymap('n', '<leader>sh', ':terminal<CR>', { noremap = true, silent = true })
end

vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true, silent = false })

vim.api.nvim_set_keymap('n', '<Tab>', ':bn<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-Tab>', ':bp<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-t>', ':enew<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<F4>', ':bdelete<CR>', { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<F12>', '<esc>:qa<CR>', { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<F10>', '<esc>:q<CR>', { noremap = true, silent = false })

for i = 1, 10 do
  vim.api.nvim_set_keymap('n', string.format('<Leader>%d', i), string.format(':%db<CR>', i), { noremap = true, silent = false })
end

for i = 1, 10 do
  vim.api.nvim_set_keymap('n', string.format('<Leader>d%d', i), string.format(':bdelete %d<CR>', i), { noremap = true, silent = false })
end
