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

-- normal bindings
whichkey.register({
    ['['] = 'Previous',
    [']'] = 'Next',
    g = 'Go (to)',
    z = 'Screen, spellcheck, folds',
    Y = 'Yank till end of line',
    ['<C-l>'] = 'Clear highlights',
})

