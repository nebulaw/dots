require("blink.cmp").setup({
  keymap = { preset = "enter" },
  snippets = { preset = "default" },
  completion = {
    accept = {
      auto_brackets = { enabled = true },
    },
    menu = {
      draw = { treesitter = { "lsp" } },
    },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 200,
    },
  },
  cmdline = { enabled = false },
  appearance = {
    kind_icons = Liv.icons.kinds,
  },
})
