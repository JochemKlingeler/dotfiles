require('lualine').setup {
    options = {
        theme = 'nord'
    },
    sections = {
        lualine_a = { {'mode', upper = true} },
        lualine_b = { {'branch', icon = ''} },
        lualine_c = { {'filename', file_status = true} },
        lualine_x = { },
        lualine_y = { {'diagnostics', sources = {'nvim_lsp'} } },
        lualine_z = { 'progress', 'location' }
    },
    inactive_sections = {
        lualine_a = { },
        lualine_b = { },
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = { },
        lualine_z = { }
    },
}
