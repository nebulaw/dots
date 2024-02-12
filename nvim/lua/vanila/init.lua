
vim.opt.nu = true
vim.opt.bg = "dark"
vim.opt.ts = 2
vim.opt.sw = 2
vim.opt.et = true
vim.opt.ai = true
vim.opt.is = true
vim.opt.sm = true
vim.opt.bo = "all"
vim.opt.so = 12
vim.opt.cb = "unnamedplus"
vim.opt.tgc = true
vim.opt.wmnu = true
vim.opt.lazyredraw = true

vim.api.nvim_set_keymap("i", "jk", "<esc>", { noremap = true, silent = true})
vim.api.nvim_set_keymap("i", "<c-s>", "<esc>:w!<cr>l", { noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<c-s>", ":w!<cr>", { noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<space>h", ":nohl<CR>", { noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<space><space>", ":Telescope find_files<CR>", { noremap = true, silent = true})

require("packer").startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'windwp/nvim-autopairs'
  use 'mg979/vim-visual-multi'
  use 'nvim-tree/nvim-web-devicons'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
end)

require("nvim-autopairs").setup({check_ts=true,})
require("telescope").setup {
  defaults = { file_ignore_patterns = { 'node_modules/' } }
}

