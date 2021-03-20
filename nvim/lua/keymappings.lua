local utils = require('utils')

-- Clear highlights
utils.map('n', '<C-l>', '<cmd>noh<CR>')

-- Use Esc in terminal to enter normal mode
utils.map('t', '<Esc>', '<C-\\><C-n>')

-- Some movement to insert mode
utils.map('i', '<M-h>', '<Left>')
utils.map('i', '<M-j>', '<Down>')
utils.map('i', '<M-k>', '<Up>')
utils.map('i', '<M-l>', '<Right>')

