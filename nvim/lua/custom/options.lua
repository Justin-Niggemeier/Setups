vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 4
vim.opt.signcolumn = "yes:1"

-- Leader remap
vim.g.mapleader = " "

-- Suchverhalten verbessern
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.showmatch = true

vim.keymap.set('n', '<leader>hl', ':let @/ = ""<CR>', { silent = true })

