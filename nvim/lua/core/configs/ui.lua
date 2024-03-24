-- Lualine {{{
require("lualine").setup({
  options = {
    theme = "auto",
    globalstatus = true,
    disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch" },
    lualine_c = {
      {
        "diagnostics",
        symbols = {
          error = " ",
          warn = " ",
          info = " ",
          hint = " ",
        },
      },
      { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
    },
    lualine_y = {
      { "progress", separator = " ", padding = { left = 1, right = 0 } },
      { "location", padding = { left = 0, right = 1 } },
    },
    lualine_z = {},
  },
  extensions = { "neo-tree", "lazy" },
})
-- }}}

-- Indentscope {{{
require("mini.indentscope").setup({
  symbol = "│",
  draw = {
    delay = 100,
  },
  options = { try_as_border = true },
})
-- }}}

-- Indent Blankline {{{
require("ibl").setup({
  indent = {
    char = "│",
    tab_char = "│",
  },
  scope = { enabled = false },
  exclude = {
    filetypes = {
      "help",
      "alpha",
      "dashboard",
      "neo-tree",
      "Trouble",
      "trouble",
      "lazy",
      "mason",
      "notify",
      "toggleterm",
      "lazyterm",
    },
  },
})
-- }}}
