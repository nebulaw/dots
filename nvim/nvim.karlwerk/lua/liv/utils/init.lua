-- Submodules load on first access: `Liv.editor` requires `liv.utils.editor` once and caches it.
-- Declare each submodule as a @field so LuaLS resolves `Liv.<name>` to its file.
---@class liv.utils
---@field editor liv.utils.editor
---@field icons liv.utils.icons
---@field lazygit liv.utils.lazygit
---@field lualine liv.utils.lualine
---@field path liv.utils.path
---@field root liv.utils.root
---@field tabline liv.utils.tabline
local M = {}

setmetatable(M, {
  __index = function(t, key)
    local mod = require("liv.utils." .. key)
    rawset(t, key, mod)
    return mod
  end,
})

return M
