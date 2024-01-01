vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.incsearch = true
vim.opt.hlsearch = false
vim.opt.scrolloff = 10
vim.opt.updatetime = 50
vim.opt.colorcolumn = "120"
vim.opt.termguicolors = true

vim.g.mapleader = " "

local telescope = require('telescope.builtin')

require('nvim-treesitter.configs').setup {
    ensure_installed = { "lua", "vim", "rust" },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}

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
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
})

local rt = require('rust-tools')
rt.setup({
    server = {
        on_attach = function(_, bufnr)
            -- Hover actions
            vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
        end,
        settings = {
            ["rust-analyzer"] = {
                checkOnSave = {
                    command = "clippy"
                },
                check = {
                    command = "clippy",
                    extraArgs = { "--all", "--", "-W", "clippy::all" },
                }
            }
        }
    },
    dap = {
        adapter = {
            type = "executable",
            command = "lldb",
            name = "lldb",
        },
    },
})

require('neotest').setup({
    adapters = {
        require('neotest-rust') {
            dap_adapter = "lldb",
        }
    }
})

local dap = require('dap')

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

vim.diagnostic.config({
    virtual_text = {
        prefix = 'x',
    },
    severity_sort = true,
    float = {
        source = "always",
    },
})

require('lspconfig').gopls.setup({
  gopls_cmd = vim.fn.expand('$GOPATH/go/gopls'),
  fillstruct = 'gopls',
  dap_debug = true,
  dap_debug_gui = true
})

vim.keymap.set('n', 'U', ':redo<cr>')
vim.keymap.set('n', '<C-Left>', '<C-w><Left>', { noremap = true, silent = false })
vim.keymap.set('n', '<C-Right>', '<C-w><Right>', { noremap = true, silent = false })
vim.keymap.set('n', '<C-Up>', '<C-w><Up>', { noremap = true, silent = false })
vim.keymap.set('n', '<C-Down>', '<C-w><Down>', { noremap = true, silent = false })
--vim.keymap.set('n', '<C-Up>', '[e')
--vim.keymap.set('n', '<C-Down>', ']e')
--vim.keymap.set('v', '<C-Up>', '[egv')
--vim.keymap.set('v', '<C-Down', ']egv')
vim.keymap.set('n', '<C-s>', ':w<CR>')
vim.keymap.set('i', '<C-s>', '<esc>:w<CR>')
vim.keymap.set("n", "<C-e>", ':Neotree toggle<CR>')
vim.keymap.set("n", "<C-q>", ':q<CR>')
vim.keymap.set('n', '<C-f>', vim.lsp.buf.format)
vim.keymap.set("n", "<C-t>", vim.cmd.tabnew)
vim.keymap.set("n", "<C-[>", vim.cmd.tabprev)
vim.keymap.set("n", "<C-]>", vim.cmd.tabnext)
vim.keymap.set("n", "<C-g>", telescope.find_files)
vim.keymap.set('n', '<leader>ff', telescope.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope.live_grep, {})
vim.keymap.set('n', '<leader>fb', telescope.buffers, {})
vim.keymap.set('n', '<leader>fh', telescope.help_tags, {})
vim.keymap.set("n", "<C-r>", vim.lsp.buf.rename)
vim.keymap.set("n", "<C-x>", vim.lsp.buf.code_action, { noremap = true })
vim.keymap.set("v", "<C-x>", vim.lsp.buf.code_action, { noremap = true })
vim.keymap.set("n", "<leader><cr>", vim.lsp.buf.code_action)
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>tf', function() require('neotest').run.run(vim.fn.expand("%")) end)
vim.keymap.set('n', '<leader>ta', function() require('neotest').run.run(vim.fn.getcwd()) end)
vim.keymap.set('n', '<leader>tt', function() require('neotest').run.run() end)
vim.keymap.set('n', '<leader>td', function() require('neotest').run.run({ stragegy = "dap" }) end)
vim.keymap.set('n', '<leader>to', function() require('neotest').output.open({ enter = true }) end)
vim.keymap.set('n', '<leader>tr', ':Trouble<cr>')
vim.keymap.set('n', '<C-b>', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F6>', function() require('dap').repl.open() end)
vim.keymap.set('n', '<F7>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F8>', function() require('dap').step_over() end)
