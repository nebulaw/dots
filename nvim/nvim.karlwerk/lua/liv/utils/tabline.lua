---@class liv.utils.tabline
local M = {}

local LEFT_SEP = "" -- nf-ple-lower_right_triangle
local RIGHT_SEP = "" -- nf-ple-lower_left_triangle
local MAX_NAME = 20
local TRUNCATE_TO = 17

---@param group string
---@param attr "fg"|"bg"
---@return integer?
local function color(group, attr)
  return vim.api.nvim_get_hl(0, { name = group, link = false })[attr]
end

--- Tab colors taken from the active colorscheme: accent from `Type`, surface from `CursorLine`
function M.set_highlights()
  local accent = color("Type", "fg")
  local surface = color("CursorLine", "bg")
  local text = color("Normal", "fg")
  vim.api.nvim_set_hl(0, "LivTabActive", { fg = surface, bg = accent, bold = true })
  vim.api.nvim_set_hl(0, "LivTabInactive", { fg = text, bg = surface })
  vim.api.nvim_set_hl(0, "LivTabSepActive", { fg = accent })
  vim.api.nvim_set_hl(0, "LivTabSepInactive", { fg = surface })
  vim.api.nvim_set_hl(0, "TabLineFill", {})
end

---@param buf integer
---@return string name, string icon
local function buf_label(buf)
  local name = vim.api.nvim_buf_get_name(buf)
  if vim.bo[buf].buftype == "terminal" then
    return "[Terminal]", ""
  end
  if vim.bo[buf].filetype == "oil" then
    local dir = vim.fn.fnamemodify(name:gsub("^oil://", ""), ":~")
    return #dir > MAX_NAME and "…" .. dir:sub(-TRUNCATE_TO) or dir, ""
  end
  if name == "" then
    return "[No Name]", ""
  end
  local file = vim.fn.fnamemodify(name, ":t")
  local icon = require("mini.icons").get("file", file)
  return #file > MAX_NAME and file:sub(1, TRUNCATE_TO) .. "…" or file, icon
end

---@param tabnr integer
---@param active boolean
---@return string
local function render_tab(tabnr, active)
  local buf = vim.fn.tabpagebuflist(tabnr)[vim.fn.tabpagewinnr(tabnr)]
  if not buf then
    return ""
  end
  local name, icon = buf_label(buf)
  local modified = vim.bo[buf].modified and "[+] " or ""
  local tab_hl = active and "%#LivTabActive#" or "%#LivTabInactive#"
  local sep_hl = active and "%#LivTabSepActive#" or "%#LivTabSepInactive#"
  local title = "   " .. modified .. icon .. " " .. name .. "   "
  return ("%%%dT%s%s%s%s%s%s%%T"):format(tabnr, sep_hl, LEFT_SEP, tab_hl, title, sep_hl, RIGHT_SEP)
end

--- Tabline: one segment per tab, labelled by the buffer in that tab's focused window; clickable
---@return string
function M.render()
  local ok, result = pcall(function()
    local parts, current = {}, vim.fn.tabpagenr()
    for tabnr = 1, vim.fn.tabpagenr("$") do
      parts[#parts + 1] = render_tab(tabnr, tabnr == current)
    end
    return table.concat(parts) .. "%#TabLineFill#"
  end)
  return ok and result or "%#TabLineFill#"
end

--- Buffer picker confirm: jump to the tab and window already showing the buffer, else open it here
---@param picker snacks.Picker
---@param item snacks.picker.Item?
function M.confirm_buffer(picker, item)
  picker:close()
  if not item then
    return
  end
  vim.schedule(function()
    for _, tab in ipairs(vim.api.nvim_list_tabpages()) do
      for _, win in ipairs(vim.api.nvim_tabpage_list_wins(tab)) do
        if vim.api.nvim_win_get_buf(win) == item.buf then
          vim.api.nvim_set_current_tabpage(tab)
          vim.api.nvim_set_current_win(win)
          return
        end
      end
    end
    vim.api.nvim_set_current_buf(item.buf)
  end)
end

return M
