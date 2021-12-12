local keymappings = {}
local utils = require('utils')
local whichkey = require('which-key')

-- Use Esc in terminal to enter normal mode
whichkey.register({['<Esc>'] = {'<C-\\><C-n>', 'Enter normal mode'}}, { mode = 't'});

-- Some movement to insert mode
whichkey.register({
    ['<M-h>'] = {'<Left>', 'Left'},
    ['<M-j>'] = {'<Down>', 'Down'},
    ['<M-k>'] = {'<Up>', 'Up'},
    ['<M-l>'] = {'<Right>', 'Right'},
}, { mode = 'i'})

function keymappings.mapGitSigns()
    whichkey.register({
        [']c'] = {[[&diff ? ']c' : '<cmd>lua require"gitsigns".next_hunk()<CR>']], 'Next hunk', expr=true},
        ['[c'] = {[[&diff ? '[c' : '<cmd>lua require"gitsigns".prev_hunk()<CR>']], 'Previous hunk', expr=true},
    })
    whichkey.register({
        ['ih'] = {[[:<C-U>lua require'gitsigns'.select_hunk()<CR>]], 'Hunk'},
        ['ah'] = {[[:<C-U>lua require'gitsigns'.select_hunk()<CR>]], 'Hunk'},
    }, { mode = 'v'})
    whichkey.register({
        ['ih'] = {[[:<C-U>lua require'gitsigns'.select_hunk()<CR>]], 'Hunk'},
        ['ah'] = {[[:<C-U>lua require'gitsigns'.select_hunk()<CR>]], 'Hunk'},
    }, { mode = 'x' })

    whichkey.register({
        h = {
            name = 'Git',
            b = { [[<cmd>lua require'gitsigns'.blame_line()<CR>]], 'Blame' },
            p = { [[<cmd>lua require'gitsigns'.preview_hunk()<CR>]], 'Previous hunk' },
            r = { [[<cmd>lua require'gitsigns'.reset_hunk()<CR>]], 'Reset hunk' },
            R = { [[<cmd>lua require'gitsigns'.reset_buffer()<CR>]], 'Reset buffer' },
            s = { [[<cmd>lua require'gitsigns'.stage_hunk()<CR>]], 'Stage hunk' },
            u = { [[<cmd>lua require'gitsigns'.undo_stage_hunk()<CR>]], 'Undo stage hunk' },
        }
    }, { prefix = '<leader>' })
end

function keymappings.mapLsp(bufnr)
    whichkey.register({
        K = {'<cmd>lua vim.lsp.buf.hover()<CR>' , 'Preview'},
        gD = {'<cmd>lua vim.lsp.buf.declaration()<CR>' , 'Declaration'},
        -- Handled by telescope instead
        --gd = {'<cmd>lua vim.lsp.buf.definition()<CR>' , 'Definition'},
        gi = {'<cmd>lua vim.lsp.buf.implementation()<CR>', 'Implementation'},
        -- Handled by telescope instead
        --gr = {'<cmd>lua vim.lsp.buf.references()<CR>', 'References'},
        ['<C-k>'] = {'<cmd>lua vim.lsp.buf.signature_help()<CR>', 'Help'},
        ['<leader>D'] = {'<cmd>lua vim.lsp.buf.type_definition()<CR>', 'Type definition'},
        ['<leader>r'] = {'<cmd>lua vim.lsp.buf.rename()<CR>', 'Rename'},
        ['<leader>e'] = {'<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', 'Line diagnostics'},
        ['[d'] = {'<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', 'Previous diagnostic'},
        [']d'] = {'<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', 'Next diagnostic'},
    }, { buffer = bufnr })
end

function keymappings.mapTelescope()
    -- Files / vim
    whichkey.register({
        name = 'Telescope, fuzzy finder',
        f = { [[<cmd>lua require('telescope.builtin').find_files()<CR>]], 'Files' },
        g = { [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], 'Grep' },
        b = { [[<cmd>lua require('telescope.builtin').buffers()<CR>]], 'Buffers' },
        t = { [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], 'Help tags' },
        a = { [[<cmd>lua require('telescope.builtin').builtin()<CR>]], 'All' },
        h = {
            name = 'Git',
            s = { [[<cmd>lua require('telescope.builtin').git_status()<CR>]], 'Status' },
            b = { [[<cmd>lua require('telescope.builtin').git_branches()<CR>]], 'Branches' },
            c = { [[<cmd>lua require('telescope.builtin').git_commits()<CR>]], 'Commits' },
        },
        c = {
            name = 'Code',
            a = { [[<cmd>lua require('telescope.builtin').lsp_code_actions()<CR>]], 'Actions' },
            d = { [[<cmd>lua require('telescope.builtin').lsp_document_diagnostics()<CR>]], 'Document diagnostics' },
            w = { [[<cmd>lua require('telescope.builtin').lsp_workspace_diagnostics()<CR>]], 'Workspace diagnostics' },
        },
    }, {prefix = '<leader>f'})

    whichkey.register({
        gd = { [[<cmd>lua require('telescope.builtin').lsp_definitions()<CR>]], 'Definitions' },
        gr = { [[<cmd>lua require('telescope.builtin').lsp_references()<CR>]], 'References' },
    })
    whichkey.register({
        ['<Leader>ca'] = { [[<cmd>lua require('telescope.builtin').lsp_range_code_actions()<CR>]], 'Actions' },
    }, {mode = 'v'})

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
    whichkey.register({
        name = "Trouble",
        R = {[[<cmd>Trouble lsp_references<cr>]], 'LSP References'},
        d = {[[<cmd>Trouble lsp_document_diagnostics<cr>]], "LSP Document diagnostic"},
        l = {[[<cmd>Trouble loclist<cr>]], 'Loclist'},
        q = {[[<cmd>Trouble quickfix<cr>]], 'Quickfix'},
        w = {[[<cmd>Trouble lsp_workspace_diagnostics<cr>]], "LSP Workspace diagnostic"},
        x = {[[<cmd>Trouble<cr>]], "Trouble"},
    }, {prefix = '<leader>x'})
end

-- normal bindings
whichkey.register({
    ['['] = 'Previous',
    [']'] = 'Next',
    g = 'Go (to)',
    z = 'Screen, spellcheck, folds',
    Y = 'Yank till end of line',
    ['<C-l>'] = 'Clear highlights',
})

-- normal bindings
-- whichkey.register({
--     ['['] = {
--         name = 'Previous ...',
--         ['['] = 'Class start',
--         [']'] = 'Class start (to end)',
--         c = 'Change {git}',
--         d = 'Diagnostic',
--         f = 'Function',
--         F = 'Function (to end)',
--     },
--     [']'] = {
--         name = 'Next ...',
--         ['['] = 'Class end',
--         [']'] = 'Class end (to end)',
--         c = 'Change {git}',
--         d = 'Diagnostic',
--         f = 'Function',
--         F = 'Function (to end)',
--     },
--     c = {
--         a = {
--             c = 'Class',
--             h = 'Hunk {git}',
--             m = 'Method',
--         },
--         i = {
--             c = 'Class',
--             h = 'Hunk {git}',
--             m = 'Method',
--         },
--     },
--     d = {
--         a = {
--             c = 'Class',
--             h = 'Hunk {git}',
--             m = 'Method',
--         },
--         i = {
--             c = 'Class',
--             h = 'Hunk {git}',
--             m = 'Method',
--         },
--     },
--     g = {
--         name = 'Go (to) ...',
--         c = 'Toggle comment',
--         d = 'Definition',
--         D = 'Declaration',
--         i = 'Implementation',
--         r = 'References',
--     },
--     K = 'Preview',
--     v = {
--         a = {
--             c = 'Class',
--             h = 'Hunk {git}',
--             m = 'Method',
--         },
--         i = {
--             c = 'Class',
--             h = 'Hunk {git}',
--             m = 'Method',
--         },
--     },
-- })

-- -- Leader bindings
-- whichkey.register({
--     c = {
--         name = 'Language server',
--         a = 'Code Actions',
--         d = 'Document Diagnostics',
--         D = 'Workspace Diagnostics',
--     },
--     D = 'Type Definition',
--     e = 'Show line diagnostic',
--     h = {
--         name = 'Git',
--         D = 'Workspace Diagnostics',
--         R = 'Reset buffer',
--         a = 'Code Actions',
--         b = 'Blame line',
--         d = 'Document Diagnostics',
--         p = 'Preview hunk',
--         r = 'Reset hunk',
--         s = 'Stage hunk',
--         u = 'Undo hunk',
--     },
--     f = {
--         name = 'Telescope, fuzzy finder',
--         a = 'All Telescope lists',
--         b = 'Finder Buffers',
--         f = 'Find Files',
--         g = 'Live Grep',
--         t = 'Help Tags',
--         h = {
--             name = 'Git',
--             b = 'Git Branches',
--             c = 'Git Commits',
--             s = 'Git Status',
--         }
--     },
--     r = 'Rename',
--     x = {
--         name = 'Trouble',
--         R = 'LSP References',
--         d = 'Document diagnostics',
--         l = 'Loclist',
--         q = 'Quickfix',
--         w = 'Workspace diagnostics',
--         x = 'Trouble',
--     }
-- }, { prefix = '<leader>' })


return keymappings
