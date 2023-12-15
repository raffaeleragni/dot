vim.opt.nu = true
--vim.opt.relativenumber = true
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


require("noice").setup()

local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

lsp.setup()

local cmp = require('cmp')
local cmp_action = lsp.cmp_action()

cmp.setup({
    sources = {
        {name = 'nvim_lsp'},
        {name = 'buffer'},
        {name = 'luasnip'},
    },
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({select = false}),
        ['<Tab>'] = cmp_action.luasnip_supertab(),
        ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
        ['<C-Space>'] = cmp.mapping.complete(),
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
})

require('rust-tools').setup({
    server = {
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
    }
})

require('neotest').setup({
    adapters = {
        require('neotest-rust') {
            dap_adapter = "lldb",
        }
    }
})


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
vim.keymap.set('n', '<C-Left>', '<C-w><Left>',{noremap = true, silent = false})
vim.keymap.set('n', '<C-Right>', '<C-w><Right>',{noremap = true, silent = false})
vim.keymap.set('n', '<C-Up>', '<C-w><Up>',{noremap = true, silent = false})
vim.keymap.set('n', '<C-Down>', '<C-w><Down>',{noremap = true, silent = false})
vim.keymap.set('n', '<C-s>', ':w<CR>')
vim.keymap.set('n', '<C-s>', ':w<CR>')
vim.keymap.set('i', '<C-s>', '<esc>:w<CR>')
vim.keymap.set('n', '<C-f>', vim.lsp.buf.format)
vim.keymap.set("n", "<C-e>", ':Neotree toggle<CR>')
vim.keymap.set("n", "<C-t>", vim.cmd.tabnew)
vim.keymap.set("n", "<C-w>", ':q<CR>')
vim.keymap.set("n", "<C-[>", vim.cmd.tabprev)
vim.keymap.set("n", "<C-]>", vim.cmd.tabnext)
vim.keymap.set("n", "<C-g>", telescope.find_files)
vim.keymap.set("n", "<C-r>", vim.lsp.buf.rename)
vim.keymap.set("n", "<C-x>", vim.lsp.buf.code_action, {noremap=true})
vim.keymap.set("v", "<C-x>", vim.lsp.buf.code_action, {noremap=true})
vim.keymap.set("n", "<leader><cr>", vim.lsp.buf.code_action)
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>tf', function() require('neotest').run.run(vim.fn.expand("%")) end)
vim.keymap.set('n', '<leader>ta', function() require('neotest').run.run(vim.fn.getcwd()) end)
vim.keymap.set('n', '<leader>tt', function() require('neotest').run.run() end)
vim.keymap.set('n', '<leader>to', function() require('neotest').output.open({enter = true}) end)

