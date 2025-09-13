vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 10

vim.o.tagfunc = "v:lua.vim.lsp.tagfunc"

vim.opt.indentexpr = ""
vim.opt.cindent = true -- might want to make this only on c/c++
-- vim.cmd("autocmd BufReadPost * :set indentexpr=")

