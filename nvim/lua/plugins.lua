return require('packer').startup(function()
    -- Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim', opt = true}

    -- Vim surround, a feature so usefull it should be included by default
    use {
        'tpope/vim-surround',
        requires = {{'tpope/vim-repeat'}}
    }

    -- Superpowered substitute
    use { 'tpope/vim-abolish' }

    -- Comment with `gc`
    use { 'tpope/vim-commentary' }

    -- `f` and `t` highlighting
    use {
        'unblevable/quick-scope',
        config = function()
            vim.cmd("let g:qs_lazy_highlight = 1")
            vim.cmd("let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']")
        end
    }

    -- Git gutter
    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        },
        config = function()
            require('config.gitsigns')
        end
    }

    -- Colorscheme
    use {
        'tjdevries/colorbuddy.nvim',
        config = function()
            require("config.colorscheme")
        end
    }
    use {
        'bkegley/gloombuddy',
        requires = {{'tjdevries/colorbuddy.nvim'}}
    }
    use {
        'tjdevries/gruvbuddy.nvim',
        requires = {{'tjdevries/colorbuddy.nvim'}}
    }
    use {
        'maaslalani/nordbuddy',
        requires = {{'tjdevries/colorbuddy.nvim'}}
    }

    -- LSP
    use {
        'neovim/nvim-lspconfig',
        config = function()
            require('lsp_lua')
        end
    }
    use {
        'nvim-lua/lsp_extensions.nvim',
        requires = {{'neovim/nvim-lspconfig'}}
    }
    use {
        'hrsh7th/nvim-compe',
        config = function()
            require('config.compe')
        end
    }
    -- Adds missing LSP diagnostics highlights
    use { 'folke/lsp-colors.nvim' }

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        config = function ()
            require('config.telescope')
        end,
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }

    -- TreeSitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function ()
            require('config.treesitter')
        end,
        requires = {
            --- Highlight definitions, navigation and rename poowered by treesitter
            {'nvim-treesitter/nvim-treesitter-refactor'},
            --- Textobjects as defined by tree-sitter queries
            {'nvim-treesitter/nvim-treesitter-textobjects'},
            --- Rainbow parentheses powered by tree-sitter
            {'p00f/nvim-ts-rainbow'},
        }
    }

    -- Statusline
    use {
        'hoob3rt/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true},
        config = function ()
            require('config.lualine')
        end
    }

    -- Which key, lists shortcuts, config is listed in keybindings
    use {
        'folke/which-key.nvim',
        config = function ()
            -- Use default settings
            require('which-key').setup {}
        end
    }

    -- Show ident line
    use {
        'lukas-reineke/indent-blankline.nvim',
        branch = 'lua'
    }
end)

