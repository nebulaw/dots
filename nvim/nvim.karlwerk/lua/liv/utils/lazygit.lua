---@class liv.utils.lazygit
local M = {}

-- Window lazygit was launched from; files opened with `e` in lazygit are edited there
local origin_win = nil

function M.open()
  origin_win = vim.api.nvim_get_current_win()
  require("snacks").lazygit()
end

--- Focus the launch window so the following `nvim --remote <file>` edits there
function M.focus_origin()
  if origin_win and vim.api.nvim_win_is_valid(origin_win) then
    pcall(vim.api.nvim_set_current_win, origin_win)
  end
end

local server = 'nvim --server "$NVIM"'

--- POSIX sh command for lazygit `os.edit` / `os.editAtLine`: quit lazygit, focus the launch window, open the file there.
--- Outside Neovim ($NVIM unset) it just runs nvim. lazygit fills in {{filename}} and {{line}}.
---@param opts? { at_line?: boolean }
---@return string
function M.edit_command(opts)
  local at_line = opts and opts.at_line
  local outside = at_line and "nvim +{{line}} -- {{filename}}" or "nvim -- {{filename}}"
  local inside = {
    server .. ' --remote-send "q"',
    server .. [[ --remote-send '<Cmd>lua require("liv.utils.lazygit").focus_origin()<CR>']],
    server .. " --remote {{filename}}",
  }
  if at_line then
    inside[#inside + 1] = server .. ' --remote-send ":{{line}}<CR>"'
  end
  return ('if [ -z "$NVIM" ]; then %s; else %s; fi'):format(outside, table.concat(inside, "; "))
end

return M
