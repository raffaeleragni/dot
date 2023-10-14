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

require('lsp-zero').setup()
require('rust-tools').setup()

vim.diagnostic.config({
  virtual_text = {
    prefix = 'x',
  },
  severity_sort = true,
  float = {
    source = "always",
  },
})
vim.keymap.set('n', '<leader>do', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>d[', vim.diagnostic.goto_prev)
vim.keymap.set('n', '<leader>d]', vim.diagnostic.goto_next)
vim.keymap.set('n', '<C-s>', ':w<CR>')
vim.keymap.set('i', '<C-s>', '<Esc>:w<CR>a')
vim.keymap.set('n', '<C-f>', vim.lsp.buf.format)
vim.keymap.set("n", "<C-e>", vim.cmd.Ex)
vim.keymap.set("n", "<C-t>", vim.cmd.tabnew)
vim.keymap.set("n", "<C-w>", vim.cmd.tabclose)
vim.keymap.set("n", "<C-[>", vim.cmd.tabprev)
vim.keymap.set("n", "<C-]>", vim.cmd.tabnext)
vim.keymap.set("n", "<C-g>", telescope.find_files)
vim.keymap.set("n", "<C-r>", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader><cr>", vim.lsp.buf.code_action)

