local utils = require('utils')

local cmd = vim.cmd

utils.opt('o', 'encoding', 'utf-8')
utils.opt('o', 'clipboard','unnamed,unnamedplus')
utils.opt('o', 'tabstop', 4)
utils.opt('o', 'shiftwidth', 4)
utils.opt('o', 'expandtab', true)

utils.opt('o', 'hidden', true)
utils.opt('o', 'wildmode', 'list:longest')

utils.opt('o', 'ignorecase', true)
utils.opt('o', 'smartcase', true)

utils.opt('w', 'number', true)
utils.opt('w', 'relativenumber', true)

-- Auto expand/shrink signcolumn
utils.opt('o', 'signcolumn', 'auto:4')

-- Highlist on yank
vim.cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'

-- Show tabs and trailing spaces
utils.opt('o', 'list', true)
utils.opt('o', 'listchars', 'tab:→ ,trail:·,extends:◣,precedes:◢')

