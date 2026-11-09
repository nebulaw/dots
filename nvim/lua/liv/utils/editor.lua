---@class liv.utils.editor
local M = {}

local fence_lang = {
  javascript = "js",
  javascriptreact = "jsx",
  typescript = "ts",
  typescriptreact = "tsx",
}

--- Copy the last visual selection as a fenced Markdown block with language, root-relative filename and start line
function M.copy_as_codeblock()
  local file = vim.api.nvim_buf_get_name(0)
  if file == "" then
    return vim.notify("Buffer has no file name", vim.log.levels.WARN)
  end
  local first, last = vim.fn.line("'<"), vim.fn.line("'>")
  local lines = vim.api.nvim_buf_get_lines(0, first - 1, last, false)
  local root = Liv.root.get()
  local relative = vim.startswith(file, root .. "/") and file:sub(#root + 2) or vim.fn.fnamemodify(file, ":~:.")
  local lang = fence_lang[vim.bo.filetype] or vim.bo.filetype

  local block = { ("```%s filename=%q line=%d"):format(lang, relative, first) }
  vim.list_extend(block, lines)
  block[#block + 1] = "```"
  vim.fn.setreg("+", table.concat(block, "\n"))
  vim.notify(("Copied %d lines as code block"):format(#lines))
end

return M
