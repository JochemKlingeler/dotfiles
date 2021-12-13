require('Comment').setup()
local whichkey = require('which-key')
whichkey.register({
    gc = {
        name = "Comment (linewise)",
        c = "Toggle current line",
        o = "Insert comment to next line",
        O = "Insert comment to previous line",
        A = "Append comment to current line",
    },
    gb = {
        name = "Comment (blockwise)",
        c = "Toggle current line",
    }
})
whichkey.register({
    gc = "Comment region (linewise)",
    gb = "Comment region (blockwise)",
}, {mode = 'v'})

