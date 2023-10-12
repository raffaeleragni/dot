vim.opt.nu = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.incsearch = true
vim.opt.hlsearch = false

vim.g.mapleader = " "
vim.keymap.set("n", "<C-e>", vim.cmd.Ex)
vim.keymap.set("n", "<C-t>", vim.cmd.tabnew)
vim.keymap.set("n", "<C-w>", vim.cmd.tabclose)
vim.keymap.set("n", "<C-[>", vim.cmd.tabprev)
vim.keymap.set("n", "<C-]>", vim.cmd.tabnext)

local telescope = require('telescope.builtin')
vim.keymap.set("n", "<C-f>", telescope.find_files)

require('nvim-treesitter.configs').setup {
  ensure_installed = { "lua", "vim", "rust" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

local lsp = require('lsp-zero').preset {
  name = 'minimal',
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
  suggest_lsp_servers = false,
}
lsp.setup()

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = false,
  float = true,
})

lsp.setup_servers {'rust_analyzer'}
lsp.nvim_workspace()

require('rust-tools').setup({})

vim.keymap.set("n", "<C-r>", vim.lsp.buf.rename)
vim.keymap.set("i", "<C-Space>", vim.lsp.buf.completion)
vim.keymap.set("n", "<A-CR>", vim.lsp.buf.code_action)

