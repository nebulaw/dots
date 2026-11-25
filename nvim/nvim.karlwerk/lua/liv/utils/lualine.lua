---@class liv.utils.lualine
local M = {}

local function fg(group)
  return { fg = require("snacks").util.color(group) }
end

--- File path relative to cwd: directory plain, filename bold (or highlighted when modified), readonly icon
---@param opts? { length?: integer, modified_hl?: string, filename_hl?: string, readonly_icon?: string }
function M.pretty_path(opts)
  opts = vim.tbl_extend("force", {
    length = 0,
    modified_hl = "MatchParen",
    filename_hl = "Bold",
    readonly_icon = " 󰌾 ",
  }, opts or {})

  return function(self)
    local path = vim.fn.expand("%:p")
    if path == "" then
      return ""
    end
    -- Relative to cwd when inside it, otherwise shortened with ~
    path = vim.fn.fnamemodify(vim.uv.fs_realpath(path) or path, ":~:.")

    local parts = vim.split(path, "/")
    if opts.length > 0 and #parts > opts.length then
      parts = { parts[1], "…", unpack(parts, #parts - opts.length + 2) }
    end
    local filename = table.remove(parts)
    local dir = #parts > 0 and table.concat(parts, "/") .. "/" or ""

    local section_hl = "lualine_" .. (self and self.options and self.options.section or "c") .. "_normal"
    local file_hl = vim.bo.modified and opts.modified_hl or opts.filename_hl
    local result = dir .. "%#" .. file_hl .. "#" .. filename .. "%#" .. section_hl .. "#"
    if vim.bo.readonly or not vim.bo.modifiable then
      result = result .. opts.readonly_icon
    end
    return result
  end
end

--- Project root name, shown only when it differs from the current working directory
function M.root_dir()
  local function name()
    local root, cwd = Liv.root.get(), Liv.root.cwd()
    return root ~= cwd and vim.fs.basename(root) or nil
  end
  return {
    function()
      return "󱉭 " .. name()
    end,
    cond = function()
      return name() ~= nil
    end,
    color = function()
      return fg("Special")
    end,
  }
end

--- Register a macro is being recorded into
function M.macro_recording()
  return {
    function()
      return "󰑋 " .. vim.fn.reg_recording()
    end,
    cond = function()
      return vim.fn.reg_recording() ~= ""
    end,
    color = function()
      return vim.tbl_extend("force", fg("DiagnosticError"), { gui = "bold" })
    end,
  }
end

return M
