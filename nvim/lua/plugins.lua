return require('packer').startup(function()
    -- Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim', opt = true}

    -- Which key, lists shortcuts, config is listed in keybindings
    use {
        'folke/which-key.nvim',
        config = function ()
            -- Use default settings
            require('which-key').setup {}
        end
    }
    -- Framework for allowing other packages to have repeatable actions `.`
    use {'tpope/vim-repeat'}
    -- Superpowered substitute
    use { 'tpope/vim-abolish' }

    -- Vim surround, a feature so usefull it should be included by default
    use {
        'machakann/vim-sandwich',
        config = function()
            require('config.surround')
        end
    }

    -- Comment with `gc`
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('config.commentary')
        end
    }

    -- `f` and `t` highlighting
    use {
        'unblevable/quick-scope',
        config = function()
            vim.cmd('let g:qs_lazy_highlight = 1')
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
        'shaunsingh/nord.nvim',
        config = function()
            require('config.colorscheme')
        end
    }

    -- LSP
    use {
        'neovim/nvim-lspconfig',
        config = function()
            require('lsp_lua')
        end
    }

    -- completion
    use {
        'hrsh7th/nvim-compe',
        config = function()
            require('config.compe')
        end
    }

    -- fix table
    use {
        'folke/trouble.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require('config.trouble')
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

    -- Show ident line
    use { 'lukas-reineke/indent-blankline.nvim' }
end)

