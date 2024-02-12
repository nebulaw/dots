-- Kanagawa Theme

vim.opt.fillchars:append({
  horiz = '━',
    horizup = '┻',
    horizdown = '┳',
    vert = '┃',
    vertleft = '┨',
    vertright = '┣',
    verthoriz = '╋',
})

require('kanagawa').setup {
  undercurl = true,
  commentStyle = { bold = true },
  functionStyle = { italic = false },
  keywordStyle = { italic = false },
  statementStyle = { bold = true },
  typeStyle = {},
  variablebuiltinStyle = { italic = true },
  specialReturn = false,
  specialException = true,
  transparent = false,
  dimInactive = false,
  globalStatus = true,
  terminalColors = true,
  colors = {},
  theme = "default"
}
