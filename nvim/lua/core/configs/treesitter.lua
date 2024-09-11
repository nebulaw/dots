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
  autotag = {
    enable = true,
  },
  rainbow = {
    enable = false,
    extended_mode = false,
    max_file_lines = nil,
    -- disable = {},
    colors = {
      "#ff0000",
      "#ffc0cb",
      "#faed37",
    },
    -- termcolors = {}
  },
})
