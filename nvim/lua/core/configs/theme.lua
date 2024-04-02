-- <space>cs - to preview colorschemes

-- Solarized Osaka
require("solarized-osaka").setup({
  transparent = not vim.g.neovide,
})

if vim.g.neovide then
  vim.cmd([[ colorscheme solarized-osaka ]])
else
  vim.cmd([[ colorscheme jellybeans-nvim ]])
end
