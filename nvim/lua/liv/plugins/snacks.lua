local Snacks = require("snacks")

Snacks.setup({
  picker = {
    enabled = true,
    -- Snacks binds <c-q> to "send to quickfix" in its windows; keep it meaning "quit" like everywhere else
    win = {
      input = { keys = { ["<c-q>"] = { "close", mode = { "n", "i" } } } },
      list = { keys = { ["<c-q>"] = "close" } },
    },
    sources = {
      files = { hidden = true },
      grep = { hidden = true },
      explorer = { hidden = true },
    },
  },
  notifier = { enabled = false },
  explorer = { enabled = true, replace_netrw = false },
  words = { enabled = true },
  lazygit = {
    enabled = true,
    config = {
      os = {
        edit = Liv.lazygit.edit_command(),
        editAtLine = Liv.lazygit.edit_command({ at_line = true }),
      },
    },
  },
})

local map = vim.keymap.set

map("n", "<leader><leader>", function() Snacks.picker.files() end, { desc = "Find files" })
map("n", "<leader>lr", function() Snacks.picker.grep() end, { desc = "Live grep" })
map("n", "<leader>bl", function() Snacks.picker.buffers({ confirm = Liv.tabline.confirm_buffer }) end, { desc = "List buffers" })
map("n", "<leader>fo", function() Snacks.picker.recent() end, { desc = "Recent files" })
map("n", "<leader>tc", function() Snacks.picker.colorschemes() end, { desc = "Change colorscheme" })
map("n", "<leader>d", function() Snacks.picker.diagnostics() end, { desc = "Diagnostics" })
map("n", "<leader>nl", function() Snacks.picker.notifications() end, { desc = "Notification list" })
map("n", "<leader>;", function() Snacks.picker.resume() end, { desc = "Resume last picker" })
