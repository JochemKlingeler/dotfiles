local utils = require('utils')

local cmd = vim.cmd

utils.opt('o', 'encoding', 'utf-8')
-- Allow access to OS clipboard
utils.opt('o', 'clipboard','unnamed,unnamedplus')
utils.opt('o', 'tabstop', 4)
utils.opt('o', 'shiftwidth', 4)
-- Expand tabs into spaces
utils.opt('o', 'expandtab', true)

utils.opt('w', 'wrap', false)
utils.opt('w', 'scrolloff', 8)

utils.opt('o', 'swapfile', false)
utils.opt('o', 'backup', false)
-- undodir defaults to user folder, which is perfectly fine
utils.opt('o', 'undofile', true)

-- Allows navigating away from unsaved files
utils.opt('o', 'hidden', true)
utils.opt('o', 'wildmode', 'list:longest')

utils.opt('o', 'ignorecase', true)
utils.opt('o', 'smartcase', true)
utils.opt('o', 'incsearch', true)

-- Show line number
utils.opt('w', 'number', true)
-- Show amount of lines away, relative to current cursor
utils.opt('w', 'relativenumber', true)

-- Auto expand/shrink signcolumn
utils.opt('o', 'signcolumn', 'auto:4')

-- Show tabs and trailing spaces
utils.opt('o', 'list', true)
utils.opt('o', 'listchars', 'tab:→ ,trail:·,extends:◣,precedes:◢')

-- Set font
utils.opt('o', 'guifont', 'CaskaydiaCove NF:h15')

-- Highlist on yank
vim.cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'

