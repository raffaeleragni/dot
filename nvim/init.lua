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
vim.opt.scrolloff = 100
vim.opt.updatetime = 50
vim.opt.colorcolumn = "120"
vim.opt.termguicolors = true

vim.g.mapleader = " "

vim.keymap.set('v', 'y', 'ygv<esc>')
vim.keymap.set('n', 'U', ':redo<cr>')
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
vim.keymap.set('n', 'H', "^")
vim.keymap.set('n', 'L', "$")
vim.keymap.set('n', '<PageUp>', '<C-u>', { noremap = true, silent = false })
vim.keymap.set('n', '<PageDown>', '<C-d>', { noremap = true, silent = false })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { noremap = true, silent = false })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { noremap = true, silent = false })
vim.keymap.set('n', '<C-Left>', '<C-w><Left>', { noremap = true, silent = false })
vim.keymap.set('n', '<C-Right>', '<C-w><Right>', { noremap = true, silent = false })
vim.keymap.set('n', '<C-Up>', '<C-w><Up>', { noremap = true, silent = false })
vim.keymap.set('n', '<C-Down>', '<C-w><Down>', { noremap = true, silent = false })
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { noremap = true, silent = false })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { noremap = true, silent = false })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { noremap = true, silent = false })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { noremap = true, silent = false })
vim.keymap.set('n', '<C-s>', ':w<CR>')
vim.keymap.set('v', '<C-s>', ':w<CR>')
vim.keymap.set('i', '<C-s>', '<esc>:w<CR>')
vim.keymap.set("n", "<C-e>", ':Neotree toggle<CR>')
vim.keymap.set("i", "<C-e>", ':Neotree toggle<CR>')
vim.keymap.set("n", "<C-q>", ':q<CR>')
vim.keymap.set('n', '<C-f>', vim.lsp.buf.format)
vim.keymap.set("n", "<C-t>", vim.cmd.tabnew)
vim.keymap.set("n", "<C-g>", function() require('telescope.builtin').find_files() end)
vim.keymap.set("n", "<C-r>", vim.lsp.buf.rename, { noremap = true })
vim.keymap.set("v", "<C-r>", vim.lsp.buf.rename, { noremap = true })
vim.keymap.set("i", "<C-r>", vim.lsp.buf.rename, { noremap = true })
vim.keymap.set("n", "<C-x>", vim.lsp.buf.code_action, { noremap = true })
vim.keymap.set("v", "<C-x>", vim.lsp.buf.code_action, { noremap = true })
vim.keymap.set("i", "<C-x>", vim.lsp.buf.code_action, { noremap = true })
vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, { desc = '[g]o to [D]eclaration' })
vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, { desc = '[g]o to [d]efinition' })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [d]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [d]iagnostic message' })
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = '[K] Hover' })
vim.keymap.set('n', '<leader>ff', function() require('telescope.builtin').find_files() end, { desc = '[f]ind [f]ile' })
vim.keymap.set('n', '<leader>fg', function() require('telescope.builtin').live_grep() end, { desc = '[f]ind [g]rep' })
vim.keymap.set('n', '<leader>fb', function() require('telescope.builtin').buffers() end, { desc = '[f]ind [b]uffers' })
vim.keymap.set('n', '<leader>fh', function() require('telescope.builtin').help_tags() end, { desc = '[f]ind [h]elp' })
vim.keymap.set('n', '<leader>fr', function() require('telescope.builtin').lsp_references() end,
    { desc = '[f]ind [r]eference' })
vim.keymap.set('n', '<leader>fd', function() require('telescope.builtin').lsp_definitions() end,
    { desc = '[f]ind [d]efinition' })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = '[D]iagnostic' })
vim.keymap.set('n', '<leader>tf', function() require('neotest').run.run(vim.fn.expand("%")) end,
    { desc = '[t]est [f]ile' })
vim.keymap.set('n', '<leader>ta', function() require('neotest').run.run(vim.fn.getcwd()) end, { desc = '[t]est [a]ll' })
vim.keymap.set('n', '<leader>tt', function() require('neotest').run.run() end, { desc = '[t]est [t]his test' })
vim.keymap.set('n', '<leader>td', function() require('neotest').run.run({ strategy = "dap" }) end,
    { desc = '[t]est [d]ebug' })
vim.keymap.set('n', '<leader>ts', function() require('neotest').run.stop() end, { desc = '[t]est [s]top' })
vim.keymap.set('n', '<leader>to', function() require('neotest').output.open({ enter = true }) end,
    { desc = '[t]est [o]utput' })
vim.keymap.set('n', '<leader>tw', ':Trouble workspace_diagnostics<cr>', { desc = '[t]rouble [w]orkspace diagnostics' })
vim.keymap.set('n', '<leader>tr', ':TroubleToggle<cr>', { desc = '[tr]rouble' })
vim.keymap.set('n', '<leader>tx', ':TroubleToggle quickfix<cr>', { desc = '[t]rouble quick fi[x]' })
vim.keymap.set('n', '<leader>tp', function() require('trouble').previous({ skip_groups = true, jump = true }) end,
    { desc = '[t]rouble [p]revious' })
vim.keymap.set('n', '<leader>tn', function() require('trouble').next({ skip_groups = true, jump = true }) end,
    { desc = '[t]rouble [n]ext' })
vim.keymap.set('n', '<leader>rr', ':RustLsp runnables<cr>', { desc = '[r]ust [r]unnables' })
vim.keymap.set('n', '<leader>rd', ':RustLsp debuggables<cr>', { desc = '[r]ust [d]ebuggables' })
vim.keymap.set('n', '<leader>rcu', function() require('crates').upgrade_all_crates() end,
    { desc = '[r]ust [c]rates [u]pdate' })
vim.keymap.set('n', '<leader>gmt', ':!go mod tidy<cr>', { desc = '[g]o [m]od [t]idy' })
vim.keymap.set('n', '<C-b>', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F6>', function() require('dap').repl.open() end)
vim.keymap.set('n', '<F7>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F8>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F9>', function() require('dap').close() end)
vim.keymap.set('n', '<leader>1', '1gt')
vim.keymap.set('n', '<leader>2', '2gt')
vim.keymap.set('n', '<leader>3', '3gt')
vim.keymap.set('n', '<leader>4', '4gt')
vim.keymap.set('n', '<leader>5', '5gt')
vim.keymap.set('n', '<leader>6', '6gt')
vim.keymap.set('n', '<leader>7', '7gt')
vim.keymap.set('n', '<leader>8', '8gt')
vim.keymap.set('n', '<leader>9', '9gt')
vim.keymap.set('n', '<leader>0', ':tablast<cr>')
vim.keymap.set('n', '<leader>l', ':tabm +1<cr>')
vim.keymap.set('n', '<leader>h', ':tabm -1<cr>')
vim.keymap.set('n', '<leader>k', 'gT')
vim.keymap.set('n', '<leader>j', 'gt')
vim.keymap.set('n', '<leader><Right>', ':tabm +1<cr>')
vim.keymap.set('n', '<leader><Left>', ':tabm -1<cr>')
vim.keymap.set('n', '<leader><Up>', 'gT')
vim.keymap.set('n', '<leader><Down>', 'gt')

vim.diagnostic.config({
    virtual_text = {
        prefix = 'x',
    },
    severity_sort = true,
    float = {
        source = "always",
    },
})

vim.api.nvim_create_autocmd('TextYankPost', {
    group = vim.api.nvim_create_augroup('highlight_yank', {}),
    desc = 'Hightlight selection on yank',
    pattern = '*',
    callback = function()
        vim.highlight.on_yank { higroup = 'IncSearch', timeout = 200 }
    end,
})



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
    'tpope/vim-commentary',
    'ryanoasis/vim-devicons',
    'nvim-telescope/telescope.nvim',

    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        opts = { flavour = "mocha" },
        init = function()
            vim.cmd.colorscheme "catppuccin"
        end
    },

    {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup()
        end
    },

    {
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate",
        dependencies = {
            'nvim-treesitter/nvim-treesitter-context'
        },
        config = function()
            require('nvim-treesitter.configs').setup {
                ensure_installed = { "vim", "regex", "lua", "bash", "markdown", "markdown_inline", "rust" },
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
            "rcarriga/nvim-notify",
        },
        config = function()
            require("notify").setup({
                render = "minimal",
                stages = "static",
                top_down = false
            })
            require("noice").setup({
                cmdline = {
                    enabled = true,
                    view = "cmdline",
                },
                lsp = {
                    override = {
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                        ["vim.lsp.util.stylize_markdown"] = true,
                        ["cmp.entry.get_documentation"] = true,
                    },
                },
                presets = {
                    bottom_search = true,
                    command_palette = true,
                    long_message_to_split = true,
                    inc_rename = false,
                    lsp_doc_border = false,
                },
            })
        end
    },

    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
            "3rd/image.nvim",
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
                    width = 30,
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
        },
        config = function()
            local lsp = require('lsp-zero').preset({})

            lsp.on_attach(function(_, bufnr)
                lsp.default_keymaps({ buffer = bufnr })
            end)

            lsp.setup()

            local cmp = require('cmp')
            cmp.setup({
                reload_workspace_from_cargo_toml = true,
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'buffer' },
                    { name = 'path' },
                    { name = 'crates' },
                },
                mapping = {
                    ['<CR>'] = cmp.mapping.confirm({ behavior = cmp.SelectBehavior.Insert, select = false }),
                    ['<C-y>'] = cmp.mapping.confirm({ behavior = cmp.SelectBehavior.Insert, select = false }),
                    ['<C-n>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
                    ['<C-p>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<PageUp>'] = cmp.mapping.scroll_docs(-4),
                    ['<PageDown>'] = cmp.mapping.scroll_docs(4),
                    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-d>'] = cmp.mapping.scroll_docs(4),
                },
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },
            })
        end
    },

    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
    },

    {
        'nvim-java/nvim-java',
        dependencies = {
            'nvim-java/lua-async-await',
            'nvim-java/nvim-java-core',
            'nvim-java/nvim-java-test',
            'nvim-java/nvim-java-dap',
            'nvim-java/nvim-java-refactor',
            'MunifTanjim/nui.nvim',
            'neovim/nvim-lspconfig',
            'mfussenegger/nvim-dap',
            {
                'williamboman/mason.nvim',
                opts = {
                    registries = {
                        'github:nvim-java/mason-registry',
                        'github:mason-org/mason-registry',
                    },
                },
            }
        },
        config = function()
            require('java').setup()
            require('lspconfig').jdtls.setup({})
        end
    },

    {
        'saecki/crates.nvim',
        ft = { "rust", "toml" },
        config = function(_, opts)
            local crates = require('crates')
            crates.setup(opts)
            crates.show()
        end
    },

    {
        'mrcjkb/rustaceanvim',
        version = '^4',
        config = function()
            vim.g.rustaceanvim = {
                server = {
                    settings = {
                        ['rust-analyzer'] = {
                            cargo = {
                                loadOutDirsFromCheck = true,
                                runBuildScripts = true,
                            },
                            checkOnSave = {
                                command = "clippy",
                                extraArgs = { "--no-deps" },
                            },
                            procMacro = {
                                enable = true,
                                ignored = {
                                    leptops_macro = { "component", "server" }
                                },
                            },
                        },
                    },
                },
            }
        end
    },

    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            "rouge8/neotest-rust",
            "nvim-neotest/neotest-go",
            "mfussenegger/nvim-dap",
            "leoluz/nvim-dap-go",
            "rcarriga/nvim-dap-ui",
            "rcasia/neotest-java",
        },
        config = function()
            require('dap-go').setup()
            require('neotest').setup({
                adapters = {
                    require('neotest-rust') {
                        dap_adapter = "lldb",
                    },
                    require('neotest-go'),
                }
            })
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
            require("go").setup()
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
    },

    {
        'laytan/cloak.nvim',
        config = function()
            require('cloak').setup()
        end
    },

})
