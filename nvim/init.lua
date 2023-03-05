vim.opt.nu = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.incsearch = true
vim.opt.hlsearch = false

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

local telescope = require('telescope.builtin')
vim.keymap.set("n", "<leader>pf", telescope.find_files)

local lsp = require('lsp-zero').preset({
  name = 'minimal',
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
  suggest_lsp_servers = false,
})
lsp.preset('recommended')
lsp.ensure_installed({
  'rust_analyzer'
})

require('lspconfig').lua_ls.setup {}

