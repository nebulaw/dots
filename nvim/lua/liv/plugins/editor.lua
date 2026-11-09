require("mini.pairs").setup({
  modes = { insert = true, command = true, terminal = false },
})

-- Comment style follows the language under the cursor (JSX inside TSX, CSS inside HTML)
require("ts_context_commentstring").setup({ enable_autocmd = false })
require("mini.comment").setup({
  options = {
    custom_commentstring = function()
      if not vim.treesitter.get_parser(0, nil, { error = false }) then
        return vim.bo.commentstring
      end
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

-- `;` replaces the usual `s` prefix, which is taken by window and oil keys
require("mini.surround").setup({
  mappings = {
    add = ";a",
    delete = ";d",
    find = ";f",
    find_left = ";F",
    highlight = ";h",
    replace = ";r",
    update_n_lines = ";n",
  },
})

-- Colors are drawn by nvim-highlight-colors; the built-in LSP swatches would draw them twice
vim.lsp.document_color.enable(false)
require("nvim-highlight-colors").setup({
  render = "background",
  enable_named_colors = true,
  enable_tailwind = true,
})

require("todo-comments").setup()
