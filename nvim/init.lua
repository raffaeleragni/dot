vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = true
vim.opt.incsearch = true
vim.opt.hlsearch = false
--vim.opt.scrolloff = 10
vim.opt.updatetime = 50
vim.opt.colorcolumn = "120"
vim.opt.termguicolors = true

vim.g.mapleader = " "

vim.diagnostic.config({
    virtual_text = {
        prefix = 'x',
    },
    severity_sort = true,
    float = {
        source = "always",
    },
})

vim.keymap.set('n', 'U', ':redo<cr>')
vim.keymap.set('n', '<PageUp>', '<C-u>', { noremap = true, silent = false })
vim.keymap.set('n', '<PageDown>', '<C-d>', { noremap = true, silent = false })
vim.keymap.set('n', '<C-Left>', '<C-w><Left>', { noremap = true, silent = false })
vim.keymap.set('n', '<C-Right>', '<C-w><Right>', { noremap = true, silent = false })
vim.keymap.set('n', '<C-Up>', '<C-w><Up>', { noremap = true, silent = false })
vim.keymap.set('n', '<C-Down>', '<C-w><Down>', { noremap = true, silent = false })
vim.keymap.set('n', '<C-s>', ':w<CR>')
vim.keymap.set('i', '<C-s>', '<esc>:w<CR>')
vim.keymap.set("n", "<C-e>", ':Neotree toggle<CR>')
vim.keymap.set("i", "<C-e>", ':Neotree toggle<CR>')
vim.keymap.set("n", "<C-q>", ':q<CR>')
vim.keymap.set('n', '<C-f>', vim.lsp.buf.format)
vim.keymap.set("n", "<C-t>", vim.cmd.tabnew)
vim.keymap.set("n", "<C-g>", function() require('telescope.builtin').find_files() end)
vim.keymap.set('n', '<leader>ff', function() require('telescope.builtin').find_files() end)
vim.keymap.set('n', '<leader>fg', function() require('telescope.builtin').live_grep() end)
vim.keymap.set('n', '<leader>fb', function() require('telescope.builtin').buffers() end)
vim.keymap.set('n', '<leader>fh', function() require('telescope.builtin').help_tags() end)
vim.keymap.set("n", "<C-r>", vim.lsp.buf.rename)
vim.keymap.set("n", "<C-x>", vim.lsp.buf.code_action, { noremap = true })
vim.keymap.set("v", "<C-x>", vim.lsp.buf.code_action, { noremap = true })
vim.keymap.set("i", "<C-l>", '<C-x><C-l>')
vim.keymap.set("n", "<leader><cr>", vim.lsp.buf.code_action)
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>tf', function() require('neotest').run.run(vim.fn.expand("%")) end)
vim.keymap.set('n', '<leader>ta', function() require('neotest').run.run(vim.fn.getcwd()) end)
vim.keymap.set('n', '<leader>tt', function() require('neotest').run.run() end)
vim.keymap.set('n', '<leader>td', function() require('neotest').run.run({ stragegy = "dap" }) end)
vim.keymap.set('n', '<leader>to', function() require('neotest').output.open({ enter = true }) end)
vim.keymap.set('n', '<leader>tr', ':Trouble<cr>')
vim.keymap.set('n', '<leader>rr', ':RustLsp runnables<cr>')
vim.keymap.set('n', '<leader>rb', ':RustLsp debuggables<cr>')
vim.keymap.set('n', '<C-b>', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F6>', function() require('dap').repl.open() end)
vim.keymap.set('n', '<F7>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F8>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F9>', function() require('dap').stop() end)



local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
    'nvim-lua/plenary.nvim',
    'tpope/vim-repeat',
    'tpope/vim-unimpaired',
    'tpope/vim-commentary',
    'ryanoasis/vim-devicons',
    'folke/todo-comments.nvim',
    'folke/neodev.nvim',
    'tpope/vim-fugitive',
    'nvim-telescope/telescope.nvim',
    'williamboman/nvim-lsp-installer',
    'mfussenegger/nvim-jdtls',
    {
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
    },
    {
        'rose-pine/neovim',
        config = function()
            require('rose-pine').setup()
            vim.cmd('colorscheme rose-pine')
        end
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate",
        config = function()
            require('nvim-treesitter.configs').setup {
                ensure_installed = { "lua", "vim", "rust" },
                sync_install = false,
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
            }
        end
    },
    {
        'folke/noice.nvim',
        dependencies = {
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
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
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
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
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
            { 'mfussenegger/nvim-dap' },
            { 'rcarriga/nvim-dap-ui' },
        },
        config = function()
            local lsp = require('lsp-zero').preset({})

            lsp.on_attach(function(client, bufnr)
                lsp.default_keymaps({ buffer = bufnr })
            end)

            lsp.setup()
            local cmp = require('cmp')
            local cmp_action = lsp.cmp_action()

            cmp.setup({
                reload_workspace_from_cargo_toml = true,
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'buffer' },
                    { name = 'luasnip' },
                },
                mapping = {
                    ['<CR>'] = cmp.mapping.confirm({ select = false }),
                    ['<Tab>'] = cmp_action.luasnip_supertab(),
                    ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<PageUp>'] = cmp.mapping.scroll_docs(-4),
                    ['<PageDown>'] = cmp.mapping.scroll_docs(4),
                    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-d>'] = cmp.mapping.scroll_docs(4),
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
            })
        end
    },
    {
        'mrcjkb/rustaceanvim',
        config = function()
            vim.g.rustaceanvim = {
                -- Plugin configuration
                tools = {
                },
                -- LSP configuration
                server = {
                    on_attach = function(client, bufnr)
                        -- you can also put keymaps in here
                    end,
                    settings = {
                        -- rust-analyzer language server configuration
                        ['rust-analyzer'] = {
                            cargo = {
                                --allFeatures = true,
                                loadOutDirsFromCheck = true,
                                runBuildScripts = true,
                            },
                            checkOnSave = {
                                --allFeatures = true,
                                command = "clippy",
                                extraArgs = { "--no-deps" },
                            },
                            procMacro = {
                                enable = true,
                                ignored = {
                                    leptops_macro = { "component", "server" }
                                    --    ["async-trait"] = { "async_trait" },
                                    --    ["napi-derive"] = { "napi" },
                                    --    ["async-recursion"] = { "async_recursion" },
                                },
                            },
                        },
                    },
                },
                -- DAP configuration
                dap = {
                },
            }
        end
    },
    {
        "folke/lsp-trouble.nvim",
        dependencies = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    },
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim",
            "rouge8/neotest-rust",
            "mfussenegger/nvim-dap",
            "rcarriga/nvim-dap-ui",
        },
        config = function()
            require('neotest').setup({
                adapters = {
                    require('neotest-rust') {
                        dap_adapter = "lldb",
                    }
                }
            })
        end
    },
    {
        "smoka7/multicursors.nvim",
        dependencies = {
            "smoka7/hydra.nvim",
        },
        config = function()
            require('multicursors').setup {
            }
        end
    },
    {
        "ray-x/go.nvim",
        dependencies = {
            "ray-x/guihua.lua",
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("go").setup {
            }
            require('lspconfig').gopls.setup({
                gopls_cmd = vim.fn.expand('$GOPATH/go/gopls'),
                fillstruct = 'gopls',
                dap_debug = true,
                dap_debug_gui = true
            })
        end
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
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
            dap.adapters.lldb = {
                type = 'server',
                port = "${port}",
                executable = {
                    command = '/usr/bin/lldb-vscode',
                    args = { "--port", "${port}" },
                }
            }

            dap.configurations.rust = {
                {
                    name = "Rust debug",
                    type = "lldb",
                    request = "launch",
                    program = function()
                        vim.fn.jobstart('cargo build')
                        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
                    end,
                    cwd = '${workspaceFolder}',
                    stopOnEntry = true,
                    showDisassembly = "never",
                },
            }


            dap.adapters.codelldb = {
                type = 'server',
                port = '${port}',
                executable = {
                    command = vim.fn.expand('$HOME/.local/share/nvim/mason/packages/codelldb/codelldb'),
                    args = { '--port', '${port}' },
                },
            }
        end
    }
})

