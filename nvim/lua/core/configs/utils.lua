-- Color Highlighting
require("nvim-highlight-colors").setup({
  render = "background",
  enable_named_colors = true,
  enable_tailwind = true,
})

-- Autopairs
require("mini.pairs").setup()

-- Comments
require("ts_context_commentstring").setup({
  enable_autocmd = false,
})

require("mini.comment").setup({
  options = {
    custom_commentstring = function()
      return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
    end,
    ignore_blank_lines = false,
    start_of_line = false,
    pad_comment_parts = true,
  },
  mappings = {
    comment = "gc",
    comment_line = "gcc",
    comment_visual = "gc",
    textobject = "gc",
  },
})

-- TODOs
require("todo-comments").setup({})
