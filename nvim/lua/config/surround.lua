vim.api.nvim_command('runtime macros/sandwich/keymap/surround.vim')

local whichkey = require('which-key')
whichkey.register({
    ys = "Surround",
    yss = "Surround line",
    yS = "Surround till end of line",
    ds = "Delete surrounding",
    dss = "Delete surrounding (line)",
    cs = "Change surrounding",
    css = "Change surrounding (line)",
})
