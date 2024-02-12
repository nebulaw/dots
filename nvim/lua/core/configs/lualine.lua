-- Lualine

local status, lualine = pcall(require, 'lualine')

if not status then return end

lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'moonfly'
    -- THEMES:
    -- horizon
    -- moonfly
    -- oceanicNext
    -- papercolor_dark
    -- everforest
    -- gruvbox_dark
    -- ayu_dark
  },
  sections = {
    lualine_a = {
      'mode',
      'filename',
    },
    lualine_b = {
      'branch',
    },
    lualine_c = {},
    lualine_x = {
      'filetype',
    },
    lualine_y = {
      'progress'
    },
    lualine_z = {
      'location',
    },
  },
}

