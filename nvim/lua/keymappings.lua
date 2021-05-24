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

function keymappings.mapGitSigns()
    utils.map('n', ']c', [[&diff ? ']c' : '<cmd>lua require"gitsigns".next_hunk()<CR>']], { expr = true })
    utils.map('n', '[c', [[&diff ? '[c' : '<cmd>lua require"gitsigns".prev_hunk()<CR>']], { expr = true })

    utils.map('o', 'ih', [[:<C-U>lua require'gitsigns'.select_hunk()<CR>]])
    utils.map('x', 'ih', [[:<C-U>lua require'gitsigns'.select_hunk()<CR>]])
    utils.map('o', 'ah', [[:<C-U>lua require'gitsigns'.select_hunk()<CR>]])
    utils.map('x', 'ah', [[:<C-U>lua require'gitsigns'.select_hunk()<CR>]])

    utils.map('n', '<leader>hb', [[<cmd>lua require'gitsigns'.blame_line()<CR>]])
    utils.map('n', '<leader>hp', [[<cmd>lua require'gitsigns'.preview_hunk()<CR>]])
    utils.map('n', '<leader>hr', [[<cmd>lua require'gitsigns'.reset_hunk()<CR>]])
    utils.map('n', '<leader>hR', [[<cmd>lua require'gitsigns'.reset_buffer()<CR>]])
    utils.map('n', '<leader>hs', [[<cmd>lua require'gitsigns'.stage_hunk()<CR>]])
    utils.map('n', '<leader>hu', [[<cmd>lua require'gitsigns'.undo_stage_hunk()<CR>]])
end

function keymappings.mapLsp(bufnr)
    local opts = { noremap=true, silent=true }
    utils.buf_map(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    utils.buf_map(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    -- Telescope does definitions
    --utils.buf_map(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    utils.buf_map(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    utils.buf_map(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    utils.buf_map(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    utils.buf_map(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    utils.buf_map(bufnr, 'n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    -- Telescope does references
    --utils.buf_map(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    utils.buf_map(bufnr, 'n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    utils.buf_map(bufnr, 'n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    utils.buf_map(bufnr, 'n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    --utils.buf_map('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
end

function keymappings.mapTelescope()
    -- Files / vim
    utils.map('n', '<Leader>ff', [[<cmd>lua require('telescope.builtin').find_files()<CR>]])
    utils.map('n', '<Leader>fg', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]])
    utils.map('n', '<Leader>fb', [[<cmd>lua require('telescope.builtin').buffers()<CR>]])
    utils.map('n', '<Leader>ft', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]])
    utils.map('n', '<Leader>fa', [[<cmd>lua require('telescope.builtin').builtin()<CR>]])

    -- Git
    utils.map('n', '<Leader>fhs', [[<cmd>lua require('telescope.builtin').git_status()<CR>]])
    utils.map('n', '<Leader>fhb', [[<cmd>lua require('telescope.builtin').git_branches()<CR>]])
    utils.map('n', '<Leader>fhc', [[<cmd>lua require('telescope.builtin').git_commits()<CR>]])

    -- LSP
    utils.map('n', 'gd', [[<cmd>lua require('telescope.builtin').lsp_definitions()<CR>]])
    utils.map('n', 'gr', [[<cmd>lua require('telescope.builtin').lsp_references()<CR>]])
    utils.map('n', '<Leader>ca', [[<cmd>lua require('telescope.builtin').lsp_code_actions()<CR>]])
    utils.map('v', '<Leader>ca', [[<cmd>lua require('telescope.builtin').lsp_range_code_actions()<CR>]])
    utils.map('n', '<Leader>cd', [[<cmd>lua require('telescope.builtin').lsp_document_diagnostics()<CR>]])
    utils.map('n', '<Leader>cD', [[<cmd>lua require('telescope.builtin').lsp_workspace_diagnostics()<CR>]])

    -- Trouble
    local actions = require('telescope.actions')
    local trouble = require('trouble.providers.telescope')
    local telescope = require('telescope')
    telescope.setup {
        defaults = {
            mappings = {
                i = { ['<c-t>'] = trouble.open_with_trouble },
                n = { ['<c-t>'] = trouble.open_with_trouble },
            },
        },
    }
end

function keymappings.mapTrouble()
    utils.map('n', '<Leader>xx', [[<cmd>Trouble<cr>]])
    utils.map('n', '<Leader>xw', [[<cmd>Trouble lsp_workspace_diagnostics<cr>]])
    utils.map('n', '<Leader>xd', [[<cmd>Trouble lsp_document_diagnostics<cr>]])
    utils.map('n', '<Leader>xl', [[<cmd>Trouble loclist<cr>]])
    utils.map('n', '<Leader>xq', [[<cmd>Trouble quickfix<cr>]])
    utils.map('n', '<Leader>xR', [[<cmd>Trouble lsp_references<cr>]])
end

local whichkey = require('which-key')

-- normal bindings
whichkey.register({
    ['['] = {
        name = 'Previous ...',
        ['['] = 'Class start',
        [']'] = 'Class start (to end)',
        c = 'Change {git}',
        d = 'Diagnostic',
        f = 'Function',
        F = 'Function (to end)',
    },
    [']'] = {
        name = 'Next ...',
        ['['] = 'Class end',
        [']'] = 'Class end (to end)',
        c = 'Change {git}',
        d = 'Diagnostic',
        f = 'Function',
        F = 'Function (to end)',
    },
    c = {
        a = {
            c = 'Class',
            h = 'Hunk {git}',
            m = 'Method',
        },
        i = {
            c = 'Class',
            h = 'Hunk {git}',
            m = 'Method',
        },
    },
    d = {
        a = {
            c = 'Class',
            h = 'Hunk {git}',
            m = 'Method',
        },
        i = {
            c = 'Class',
            h = 'Hunk {git}',
            m = 'Method',
        },
    },
    g = {
        name = 'Go (to) ...',
        c = 'Toggle comment',
        d = 'Definition',
        D = 'Declaration',
        i = 'Implementation',
        r = 'References',
    },
    K = 'Preview',
    v = {
        a = {
            c = 'Class',
            h = 'Hunk {git}',
            m = 'Method',
        },
        i = {
            c = 'Class',
            h = 'Hunk {git}',
            m = 'Method',
        },
    },
})

-- Leader bindings
whichkey.register({
    c = {
        name = 'Language server',
        a = 'Code Actions',
        d = 'Document Diagnostics',
        D = 'Workspace Diagnostics',
    },
    D = 'Type Definition',
    e = 'Show line diagnostic',
    h = {
        name = 'Git',
        D = 'Workspace Diagnostics',
        R = 'Reset buffer',
        a = 'Code Actions',
        b = 'Blame line',
        d = 'Document Diagnostics',
        p = 'Preview hunk',
        r = 'Reset hunk',
        s = 'Stage hunk',
        u = 'Undo hunk',
    },
    f = {
        name = 'Telescope, fuzzy finder',
        a = 'All Telescope lists',
        b = 'Finder Buffers',
        f = 'Find Files',
        g = 'Live Grep',
        t = 'Help Tags',
        h = {
            name = 'Git',
            b = 'Git Branches',
            c = 'Git Commits',
            s = 'Git Status',
        }
    },
    r = 'Rename',
    x = {
        name = 'Trouble',
        R = 'LSP References',
        d = 'Document diagnostics',
        l = 'Loclist',
        q = 'Quickfix',
        w = 'Workspace diagnostics',
        x = 'Trouble',
    }
}, { prefix = '<leader>' })


return keymappings
