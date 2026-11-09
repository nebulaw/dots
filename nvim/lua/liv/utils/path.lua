---@class liv.utils.path
local M = {}

---@type table<string, fun(): string?>
local resolvers = {}

--- Register how to find the path under the cursor in buffers of a filetype
---@param filetype string
---@param resolver fun(): string?
function M.register(filetype, resolver)
  resolvers[filetype] = resolver
end

--- Path under the cursor: a registered resolver's result, otherwise the buffer's file and cursor line
---@return string? path, integer? line
local function target()
  local resolver = resolvers[vim.bo.filetype]
  if resolver then
    return resolver(), nil
  end
  local file = vim.api.nvim_buf_get_name(0)
  if file == "" then
    return nil, nil
  end
  return file, vim.fn.line(".")
end

--- Copy the path under the cursor to the system clipboard, with `#L<line>` for file buffers
---@param style "relative"|"absolute" relative to the current working directory, or full path
function M.yank(style)
  local path, line = target()
  if not path then
    vim.notify("No path under cursor", vim.log.levels.WARN)
    return
  end
  path = vim.fn.fnamemodify(path, style == "relative" and ":." or ":p")
  if line then
    path = path .. "#L" .. line
  end
  vim.fn.setreg("+", path)
  vim.notify("Yanked: " .. path)
end

return M
