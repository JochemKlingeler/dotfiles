local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    require('keymappings').mapLsp(bufnr)
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
    lsp_extensions = {
        {
            [[CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost]]
            .. [[ *.rs ]] 
            .. [[lua require'lsp_extensions'.inlay_hints{ prefix = ' » ', highlight = "NonText", enabled = {"ChainingHint"} }]]
        };
    },
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

