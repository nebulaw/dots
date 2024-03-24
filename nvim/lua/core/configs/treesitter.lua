-- Treesitter
require("nvim-treesitter.configs").setup({
  ensure_installed = {},
  sync_install = true,
  auto_install = true,
  highlight = {
    enable = true,
  },
})

require("nvim-treesitter.configs").setup({
  highlight = {},
  indent = {
    enable = true,
  },
})
