require('trouble').setup{ }
require('which-key').register({
    name = "Trouble",
    R = {[[<cmd>Trouble lsp_references<cr>]], 'LSP References'},
    d = {[[<cmd>Trouble lsp_document_diagnostics<cr>]], "LSP Document diagnostic"},
    l = {[[<cmd>Trouble loclist<cr>]], 'Loclist'},
    q = {[[<cmd>Trouble quickfix<cr>]], 'Quickfix'},
    w = {[[<cmd>Trouble lsp_workspace_diagnostics<cr>]], "LSP Workspace diagnostic"},
    x = {[[<cmd>Trouble<cr>]], "Trouble"},
}, {prefix = '<leader>x'})

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

