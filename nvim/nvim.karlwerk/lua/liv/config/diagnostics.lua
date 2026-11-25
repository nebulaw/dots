local icons = Liv.icons.diagnostics
local severity = vim.diagnostic.severity

vim.diagnostic.config({
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  virtual_text = {
    spacing = 4,
    prefix = "●",
    -- "message (source: code)", dropping whichever of source/code the server did not send
    format = function(diagnostic)
      local origin = vim.tbl_filter(function(part)
        return part ~= nil and part ~= ""
      end, { diagnostic.source, diagnostic.code and tostring(diagnostic.code) })
      if #origin == 0 then
        return diagnostic.message
      end
      return string.format("%s (%s)", diagnostic.message, table.concat(origin, ": "))
    end,
  },
  signs = {
    text = {
      [severity.ERROR] = icons.Error,
      [severity.WARN] = icons.Warn,
      [severity.HINT] = icons.Hint,
      [severity.INFO] = icons.Info,
    },
  },
  float = {
    source = true,
  },
})
