local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    require('which-key').register({
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

nvim_lsp.rust_analyzer.setup {
    on_attach = on_attach,
    settings = {
        ["rust-analyzer"] = {
            ["checkOnSave"] = {
                command = "clippy"
            },
        },
    }
}

local autoccmds = {
    lsp_rust_autoformat_on_write = {
        {
            [[BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 1000)]]
        };
    },
}
local utils = require('utils')
utils.create_augroups(autoccmds)

-- Clear LSP diagnostic chars
vim.fn.sign_define('LspDiagnosticsSignError', {text = '', numhl = 'LspDiagnosticsDefaultError'})
vim.fn.sign_define('LspDiagnosticsSignWarning', {text = '', numhl = 'LspDiagnosticsDefaultWarning'})
vim.fn.sign_define('LspDiagnosticsSignInformation', {text = '', numhl = 'LspDiagnosticsDefaultInformation'})
vim.fn.sign_define('LspDiagnosticsSignHint', {text = '', numhl = 'LspDiagnosticsDefaultHint'})

