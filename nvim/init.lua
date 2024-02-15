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
local telescope = require('telescope.builtin')
vim.keymap.set("n", "<C-g>", telescope.find_files)
vim.keymap.set('n', '<leader>ff', telescope.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope.live_grep, {})
vim.keymap.set('n', '<leader>fb', telescope.buffers, {})
vim.keymap.set('n', '<leader>fh', telescope.help_tags, {})
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
