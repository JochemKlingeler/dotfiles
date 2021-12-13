local whichkey = require('which-key')
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

