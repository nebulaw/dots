local Snacks = require("snacks")
local oil = require("oil")

oil.setup({
  columns = {
    "icon",
    { "permissions", highlight = "Type" },
    { "size", highlight = "String" },
    { "mtime", highlight = "Keyword" },
  },
  keymaps = {
    ["h"] = { "actions.parent", mode = "n" },
    ["q"] = { "actions.close", mode = "n" },
  },
  view_options = {
    show_hidden = true,
  },
  float = {
    border = "rounded",
    max_width = 200,
    win_options = { winblend = 0 },
  },
  preview_win = {
    update_on_cursor_moved = true,
  },
  lsp_file_methods = {
    autosave_changes = true, -- Save buffers whose imports LSP rewrote after a rename
  },
})

Liv.path.register("oil", function()
  local dir = oil.get_current_dir()
  local entry = oil.get_cursor_entry()
  if not dir then
    return nil
  end
  return entry and dir .. entry.name or dir
end)

Liv.path.register("snacks_picker_list", function()
  local win = vim.api.nvim_get_current_win()
  for _, picker in ipairs(Snacks.picker.get()) do
    if picker.list.win.win == win then
      local item = picker:current()
      return item and Snacks.picker.util.path(item)
    end
  end
end)

local map = vim.keymap.set

map("n", "sf", function() oil.open_float(nil, { preview = {} }) end, { desc = "File explorer (oil float)" })
map("n", "<leader>e", function() Snacks.explorer() end, { desc = "File tree (snacks explorer)" })
