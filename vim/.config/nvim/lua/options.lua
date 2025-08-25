
vim.cmd('syntax enable')
vim.cmd('syntax on')
vim.o.showcmd = true

vim.api.nvim_create_autocmd("FileType", { pattern = "yaml", command = "setlocal ts=2 sts=2 sw=2 expandtab" })
vim.api.nvim_create_autocmd("FileType", { pattern = "yml", command = "setlocal ts=2 sts=2 sw=2 expandtab" })

vim.opt.swapfile = false
vim.o.autoread = true
vim.o.backspace = 'indent,eol,start'

vim.o.fileformat = 'unix'

vim.o.laststatus = 2
vim.o.background = 'dark'
vim.o.autowrite = true

vim.o.number = true
vim.o.relativenumber = true

vim.o.hidden = true

vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.shiftwidth = 4

vim.o.autoindent = true

vim.o.incsearch = true
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.gdefault = true

vim.o.encoding = 'utf-8'
vim.o.binary = true
vim.o.nrformats = 'bin,hex'

vim.o.cursorline = true

vim.o.showmatch = true

vim.o.title = true
vim.o.titleold = 'Terminal'
vim.o.titlestring = '%F'

vim.o.wildignore = vim.o.wildignore .. ',**/node_modules/**'
