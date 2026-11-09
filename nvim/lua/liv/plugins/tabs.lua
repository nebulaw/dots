local tabline = Liv.tabline
local map = vim.keymap.set

tabline.set_highlights()
vim.api.nvim_create_autocmd("ColorScheme", {
  group = vim.api.nvim_create_augroup("LivTabline", { clear = true }),
  desc = "Re-derive tab colors from the new colorscheme",
  callback = tabline.set_highlights,
})
vim.o.showtabline = 1
vim.o.tabline = "%!v:lua.Liv.tabline.render()"

-- Filename label in the top-right of every window, since the statusline is global
require("incline").setup({
  window = {
    margin = { vertical = 0, horizontal = 1 },
    zindex = 10,
  },
  hide = {
    cursorline = "smart",
  },
  render = function(props)
    local name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
    if vim.bo[props.buf].modified then
      name = "[+] " .. name
    end
    local icon, hl = require("mini.icons").get("file", name)
    return { { icon, group = hl }, { " " }, { name } }
  end,
})

map("n", "te", "<cmd>tabedit<cr>", { desc = "New tab" })
map("n", "tc", "<cmd>tabclose<cr>", { desc = "Close tab" })
map("n", "tn", "<cmd>tabnext<cr>", { desc = "Next tab" })
map("n", "tp", "<cmd>tabprevious<cr>", { desc = "Previous tab" })
