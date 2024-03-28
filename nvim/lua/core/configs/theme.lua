-- <space>cs - to preview colorschemes

-- Solarized Osaka
require("solarized-osaka").setup({
  transparent = not vim.g.neovide,
})

vim.cmd([[ colorscheme solarized-osaka ]])
