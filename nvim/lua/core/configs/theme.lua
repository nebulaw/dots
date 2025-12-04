-- <space>cs - to preview colorschemes

-- Sets undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Co = "\e[4:0m"]])

-- Solarized Osaka
require("solarized-osaka").setup({
  transparent = not vim.g.neovide,
})

if vim.g.neovide then
  vim.cmd([[ colorscheme solarized-osaka ]])
else
  vim.cmd([[ colorscheme solarized-osaka ]])
end
