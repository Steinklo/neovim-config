vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
        -- Packer can manage itself
        use 'wbthomason/packer.nvim'
        use {
            "phha/zenburn.nvim",
            config = function() require("zenburn").setup() end
        }

        -- Themes and colors
        use 'gbprod/nord.nvim'
        use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
        use('nvim-treesitter/playground')

        -- Digg in the pig

        use {
            "folke/which-key.nvim",
            config = function()
                vim.o.timeout = true
                vim.o.timeoutlen = 300
                require("which-key").setup {
                    -- your configuration comes here
                    -- or leave it empty to use the default settings
                    -- refer to the configuration section below
                }
            end
        }

        -- Navigation
        use('theprimeagen/harpoon')
        use {
            'nvim-telescope/telescope.nvim', tag = '0.1.0',
            -- or                            , branch = '0.1.x',
            requires = { { 'nvim-lua/plenary.nvim' } }
        }

        -- Git
        use('mbbill/undotree')
        use('tpope/vim-fugitive')

        -- Debugging
        use("mfussenegger/nvim-dap")
        use("leoluz/nvim-dap-go")
        use("rcarriga/nvim-dap-ui")
        use("theHamsta/nvim-dap-virtual-text")
        use("nvim-telescope/telescope-dap.nvim")

        -- LSP
        use { 'neoclide/coc.nvim', branch = 'release' }
    end)
