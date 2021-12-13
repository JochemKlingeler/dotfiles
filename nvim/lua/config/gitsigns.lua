require('gitsigns').setup {
    keymaps = {}
}
local whichkey = require('which-key')
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

