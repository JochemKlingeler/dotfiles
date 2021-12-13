require('nvim-treesitter.configs').setup {
    ensure_installed = { "rust" },
    highlight = { enable = true },
    rainbow = { enable = true },
    refactor = {
        highlight_current_scope = {enable = false},
        highlight_definitions = {enable = true},
    },
    textobjects = {
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                ["]f"] = "@function.outer",
                ["]]"] = "@class.outer",
            },
            goto_next_end = {
                ["]F"] = "@function.outer",
                ["]["] = "@class.outer",
            },
            goto_previous_start = {
                ["[f"] = "@function.outer",
                ["[["] = "@class.outer",
            },
            goto_previous_end = {
                ["[F"] = "@function.outer",
                ["[]"] = "@class.outer",
            },
        },
        select = {
            enable = true,
            -- Automatically jump forward to textobj, similar to targets.vim 
            lookahead = true,
            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
            },
        },
    }
}

local whichkey = require('which-key')
whichkey.register({
    ["]f"] = 'Function',
    ["]F"] = 'Function (outer)',
    ["]]"] = 'Class',
    ["]["] = 'Class (outer)',
    ["[f"] = 'Function',
    ["[F"] = 'Function (outer)',
    ["[]"] = 'Class',
    ["[["] = 'Class (outer)',
    c = {
        ['if'] = "Function",
        ['af'] = "Function",
        ['ic'] = "Class",
        ['ac'] = "Class",
    },
    d = {
        ['if'] = "Function",
        ['af'] = "Function",
        ['ic'] = "Class",
        ['ac'] = "Class",
    },
    v = {
        ['if'] = "Function",
        ['af'] = "Function",
        ['ic'] = "Class",
        ['ac'] = "Class",
    },
})
