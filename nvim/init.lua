vim.opt.nu = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.incsearch = true
vim.opt.hlsearch = false

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<leader>cc", function() vim.cmd('!cargo clippy') end)
vim.keymap.set("n", "<leader>cf", function() vim.cmd('!cargo fmt') end)
vim.keymap.set("n", "<leader>cb", function() vim.cmd('!cargo build') end)
vim.keymap.set("n", "<leader>ct", function() vim.cmd('!cargo test') end)
vim.keymap.set("n", "<leader>cr", function() vim.cmd('!cargo run') end)

vim.keymap.set("n", "<leader>tn", vim.cmd.tabnew)
vim.keymap.set("n", "<leader>tc", vim.cmd.tabclose)
vim.keymap.set("n", "<leader>[", vim.cmd.tabprev)
vim.keymap.set("n", "<leader>]", vim.cmd.tabnext)

local telescope = require('telescope.builtin')
vim.keymap.set("n", "<leader>pf", telescope.find_files)

require('nvim-treesitter.configs').setup {
  ensure_installed = { "lua", "vim", "help", "query", "rust" },
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

vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader><CR>", vim.lsp.buf.code_action)

