---@class liv.utils.root
local M = {}

M.markers = { ".git", "lua", "package.json", "Makefile", "Cargo.toml", "go.mod", "pyproject.toml" }

---@param path string
---@return string
local function normalize(path)
  return (vim.uv.fs_realpath(path) or path):gsub("/$", "")
end

---@return string
function M.cwd()
  return normalize(vim.uv.cwd() or vim.fn.getcwd())
end

--- Project root of a buffer: nearest parent with a root marker, otherwise the current working directory
---@param buf? integer
---@return string
function M.get(buf)
  buf = buf or 0
  local root = vim.api.nvim_buf_get_name(buf) ~= "" and vim.fs.root(buf, M.markers) or nil
  return root and normalize(root) or M.cwd()
end

return M
