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
            goto_next_start = {
                ["]F"] = "@function.outer",
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
                ["[f"] = "@function.outer",
                ["[]"] = "@class.outer",
            },
        },
        select = {
            enable = true,
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
            },
        },
    }
}

