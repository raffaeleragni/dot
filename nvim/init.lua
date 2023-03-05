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

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "vim", "help", "query", "rust", "javascript", "typescript" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

local lsp = require('lsp-zero').preset({
  name = 'minimal',
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
  suggest_lsp_servers = false,
})
lsp.setup_servers({'eslint', 'tsserver', 'rust_analyzer'})
lsp.nvim_workspace()
lsp.setup()

require('rust-tools').setup({})

