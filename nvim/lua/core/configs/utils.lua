
-- Color Highlighting
require('nvim-highlight-colors').setup {
  render = 'background',
  enable_named_colors = true,
  enable_tailwind = true,
}

-- Autopairs
require('nvim-autopairs').setup({
  check_ts = true,
})

require('cmp').event:on({
  'confirm_done',
  require('nvim-autopairs.completion.cmp').on_confirm_done({
    map_char = { tex = '' },
  })
})

