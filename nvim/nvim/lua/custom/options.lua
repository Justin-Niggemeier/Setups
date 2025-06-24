vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 4
vim.g.mapleader = " "
vim.opt.signcolumn = "yes:1"
vim.keymap.set('n', '<leader>di', function() vim.diagnostic.hide() end)
vim.keymap.set('n', '<leader>de', function() vim.diagnostic.show() end)
