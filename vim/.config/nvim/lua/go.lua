vim.api.nvim_create_autocmd("FileType", { pattern = "go", command = "map <F1> :GoDoc<enter>" })
vim.api.nvim_create_autocmd("FileType", { pattern = "go", command = "map <F8> :GoFmt<enter>" })

vim.o.updatetime = 100
vim.g.go_def_mode='gopls'
vim.g.go_info_mode='gopls'

vim.g.go_highlight_functions = 1
vim.g.go_highlight_methods = 1
vim.g.go_highlight_structs = 1
vim.g.go_highlight_operators = 1
vim.g.go_highlight_build_constraints = 1
vim.g.go_alternate_mode = "vsplit"

vim.g.go_fmt_command = "goimports"
vim.o.wildignore = vim.o.wildignore .. ',**/vendor/**'
