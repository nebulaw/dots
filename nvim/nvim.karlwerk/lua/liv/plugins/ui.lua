-- Clear backgrounds after any colorscheme loads so the terminal background shows through
local transparent_groups = {
  "NormalNC",
  "NormalFloat",
  "FloatBorder",
  "FloatTitle",
  "SignColumn",
  "LineNr",
  "FoldColumn",
  "EndOfBuffer",
  "WinBar",
  "WinBarNC",
}

local function clear_bg(name)
  local hl = vim.api.nvim_get_hl(0, { name = name, link = false })
  hl.bg, hl.ctermbg = nil, nil
  vim.api.nvim_set_hl(0, name, hl)
end

vim.api.nvim_create_autocmd("ColorScheme", {
  group = vim.api.nvim_create_augroup("LivTransparent", { clear = true }),
  desc = "Make editor background transparent",
  callback = function()
    local normal_bg = vim.api.nvim_get_hl(0, { name = "Normal" }).bg
    for name, hl in pairs(vim.api.nvim_get_hl(0, {})) do
      if not hl.link and hl.bg and hl.bg == normal_bg then
        clear_bg(name)
      end
    end
    for _, name in ipairs(transparent_groups) do
      clear_bg(name)
    end
  end,
})

vim.cmd.colorscheme("jellybeans-nvim")

local icons = require("mini.icons")
icons.setup()
icons.mock_nvim_web_devicons()
