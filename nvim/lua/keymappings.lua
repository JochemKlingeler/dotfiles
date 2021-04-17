local keymappings = {}
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

-- Treesitter bindings
-- -- Go to function/methods
-- ]m > next function
-- [m > previous function
-- ]M > next function (to end)
-- [M > previous function (to end)
-- -- Go to class
-- ]] > class end
-- ][ > class end (to start)
-- [ [ > class start
-- [] > class start (to end)
-- -- select
-- af > after function
-- if > in function
-- ac > after class
-- ic > in class
--

function keymappings.mapGitSigns()
    utils.map('n', ']c', "&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'", { expr = true })
    utils.map('n', '[c', "&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'", { expr = true })

    utils.map('o', 'ih', ':<C-U>lua require"gitsigns".select_hunk()<CR>')
    utils.map('x', 'ih', ':<C-U>lua require"gitsigns".select_hunk()<CR>')

    utils.map('n', '<leader>hs', '<cmd>lua require"gitsigns".stage_hunk()<CR>')
    utils.map('n', '<leader>hu', '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>')
    utils.map('n', '<leader>hr', '<cmd>lua require"gitsigns".reset_hunk()<CR>')
    utils.map('n', '<leader>hR', '<cmd>lua require"gitsigns".reset_buffer()<CR>')
    utils.map('n', '<leader>hp', '<cmd>lua require"gitsigns".preview_hunk()<CR>')
    utils.map('n', '<leader>hb', '<cmd>lua require"gitsigns".blame_line()<CR>')
end

function keymappings.mapLsp(bufnr)
    local opts = { noremap=true, silent=true }
    utils.buf_map(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    utils.buf_map(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    -- Telescope does definitions
    --utils.buf_map(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    utils.buf_map(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    utils.buf_map(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    utils.buf_map(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    utils.buf_map(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    utils.buf_map(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    -- Telescope does references
    --utils.buf_map(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    utils.buf_map(bufnr, 'n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    utils.buf_map(bufnr, 'n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    utils.buf_map(bufnr, 'n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    --utils.buf_map('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
end

function keymappings.mapTelescope()
    -- Files / vim
    utils.map('n', '<Leader>ff', [[<cmd>lua require('telescope.builtin').find_files()<CR>]])
    utils.map('n', '<Leader>fg', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]])
    utils.map('n', '<Leader>fb', [[<cmd>lua require('telescope.builtin').buffers()<CR>]])
    utils.map('n', '<Leader>fh', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]])
    utils.map('n', '<Leader>fa', [[<cmd>lua require('telescope.builtin').builtin()<CR>]])

    -- Git
    utils.map('n', '<Leader>fis', [[<cmd>lua require('telescope.builtin').git_status()<CR>]])
    utils.map('n', '<Leader>fib', [[<cmd>lua require('telescope.builtin').git_branches()<CR>]])
    utils.map('n', '<Leader>fic', [[<cmd>lua require('telescope.builtin').git_commits()<CR>]])

    -- LSP
    utils.map('n', 'gd', [[<cmd>lua require('telescope.builtin').lsp_definitions()<CR>]])
    utils.map('n', 'gr', [[<cmd>lua require('telescope.builtin').lsp_references()<CR>]])
    utils.map('n', '<Leader>ca', [[<cmd>lua require('telescope.builtin').lsp_code_actions()<CR>]])
    utils.map('v', '<Leader>ca', [[<cmd>lua require('telescope.builtin').lsp_range_code_actions()<CR>]])
    utils.map('n', '<Leader>cd', [[<cmd>lua require('telescope.builtin').lsp_document_diagnostics()<CR>]])
    utils.map('n', '<Leader>cD', [[<cmd>lua require('telescope.builtin').lsp_workspace_diagnostics()<CR>]])
end

return keymappings
