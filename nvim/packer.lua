vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'tpope/vim-repeat'
    use 'tpope/vim-unimpaired'
    use 'ryanoasis/vim-devicons'
    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use {
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            require('rose-pine').setup()
            vim.cmd('colorscheme rose-pine')
        end
    }
    use { 'nvim-treesitter/nvim-treesitter', run = ":TSUpdate" }
    use {
        'folke/noice.nvim',
        requires = {
            "MunifTanjim/nui.nvim",
            {
                "rcarriga/nvim-notify",
                config = function()
                    require("notify").setup({
                        render = "minimal",
                        stages = "static",
                        top_down = false
                    })
                end
            }
        },
        config = function()
            require("noice").setup({
                cmdline = {
                    enabled = true,
                    view = "cmdline",
                },
                lsp = {
                    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                    override = {
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                        ["vim.lsp.util.stylize_markdown"] = true,
                        ["cmp.entry.get_documentation"] = true,
                    },
                },
                -- you can enable a preset for easier configuration
                presets = {
                    bottom_search = true,         -- use a classic bottom cmdline for search
                    command_palette = true,       -- position the cmdline and popupmenu together
                    long_message_to_split = true, -- long messages will be sent to a split
                    inc_rename = false,           -- enables an input dialog for inc-rename.nvim
                    lsp_doc_border = false,       -- add a border to hover docs and signature help
                },
            })
        end
    }
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            "3rd/image.nvim",              -- Optional image support in preview window: See `# Preview Mode` for more information
        },
        config = function()
            require("neo-tree").setup({
                enable_diagnostics = true,
                enable_git_status = true,
                filesystem = {
                    filtered_items = {
                        visible = true
                    }
                },
                window = {
                    position = "left",
                    width = 25,
                }
            })
        end
    }
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional
            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },                  -- Required
            { 'hrsh7th/cmp-buffer' },                -- Optional
            { 'hrsh7th/cmp-path' },                  -- Optional
            { 'saadparwaiz1/cmp_luasnip' },          -- Optional
            { 'hrsh7th/cmp-nvim-lsp' },              -- Required
            { 'hrsh7th/cmp-nvim-lua' },              -- Optional
            -- Snippets
            { 'L3MON4D3/LuaSnip' },                  -- Required
            { 'rafamadriz/friendly-snippets' },      -- Optional
            { 'simrat39/rust-tools.nvim' },
            { 'mfussenegger/nvim-dap' },
            { 'rcarriga/nvim-dap-ui' },
        }
    }
    use {
        "folke/lsp-trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }
    use { 'williamboman/nvim-lsp-installer' }
    use { 'mfussenegger/nvim-jdtls' }
    use {
        "nvim-neotest/neotest",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim",
            "rouge8/neotest-rust",
            "mfussenegger/nvim-dap",
            "rcarriga/nvim-dap-ui",
        }
    }
    use 'tpope/vim-fugitive'
    use {
        "smoka7/multicursors.nvim",
        requires = {
            "smoka7/hydra.nvim",
        },
        config = function()
            require('multicursors').setup {
            }
        end
    }
    use {
        "ray-x/go.nvim",
        requires = {
            "ray-x/guihua.lua",
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("go").setup {
            }
        end
    }
    use {
        "rcarriga/nvim-dap-ui",
        requires = {
            "mfussenegger/nvim-dap"
        },
        config = function()
            local dap, dapui = require("dap"), require("dapui")
            dapui.setup()
            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end
        end
    }
end)
