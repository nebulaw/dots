-- Treesitter configuration

local status, ntsc = pcall(require, 'nvim-treesitter.configs')

if not status then return end

ntsc.setup {
  ensure_installed = {
    'markdown',
    'markdown_inline',
    'vue',
    'cpp',
    'lua',
    'python',
    'vim',
    'java',
    'rust',
    'ruby',
    'c',
    'ocaml',
    'html',
    'javascript',
  },
  sync_install = true,
  auto_install = true,
  highlight = {
    enable = true,
  },
}

require("nvim-treesitter.configs").setup {
  highlight = {},
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
  indent = {
    enable = true,
  }
}



