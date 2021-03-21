local utils = require('utils')

-- menuone: Show popup when only one option is available
-- noinsert: Do not insert text until selection is done
-- noselect: Do not automatically select the first result
vim.o.completeopt = "menuone,noinsert,noselect"

require'compe'.setup {
    enabled = true;
    autocomplete = true;
    debug = false;
    min_length = 1;
    preselect = 'enable';
    throttle_time = 80;
    source_timeout = 200;
    incomplete_delay = 400;
    max_abbr_width = 100;
    max_kind_width = 100;
    max_menu_width = 100;
    documentation = true;

    source = {
        buffer = true;
        calc = true;
        emoji = true;
        nvim_lsp = true;
        nvim_lua = true;
        nvim_treesitter = true;
        path = true;
        spell = true;
        vsnip = false;
    };
}

utils.map('i', '<C-Space>', [[compe#complete()]], {silent=true, expr=true})
utils.map('i', '<CR>', [[compe#confirm('<CR>')]], {silent=true, expr=true})
utils.map('i', '<C-e>', [[compe#close('<C-e>')]], {silent=true, expr=true})
--utils.map('i', '<C-f>', [[compe#scroll({ 'delta': +4 })]], {silent=true, expr=true})
--utils.map('i', '<C-d>', [[compe#scroll({ 'delta': -4 })]], {silent=true, expr=true})

