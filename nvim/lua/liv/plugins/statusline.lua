local icons = Liv.icons
local components = Liv.lualine

require("lualine").setup({
  options = {
    theme = "jellybeans",
    globalstatus = true,
    refresh = {
      events = {
        "WinEnter",
        "BufEnter",
        "BufWritePost",
        "SessionLoadPost",
        "FileChangedShellPost",
        "VimResized",
        "Filetype",
        "CursorMoved",
        "CursorMovedI",
        "ModeChanged",
        "RecordingEnter",
        "RecordingLeave",
      },
    },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch" },
    lualine_c = {
      components.root_dir(),
      { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
      { components.pretty_path() },
    },
    lualine_x = {
      components.macro_recording(),
      {
        "diagnostics",
        symbols = {
          error = icons.diagnostics.Error,
          warn = icons.diagnostics.Warn,
          info = icons.diagnostics.Info,
          hint = icons.diagnostics.Hint,
        },
      },
      {
        "diff",
        symbols = {
          added = icons.git.added,
          modified = icons.git.modified,
          removed = icons.git.removed,
        },
        source = function()
          local summary = vim.b.minidiff_summary
          if summary and summary.add then
            return { added = summary.add, modified = summary.change, removed = summary.delete }
          end
        end,
      },
    },
    lualine_y = {
      { "progress", separator = " ", padding = { left = 1, right = 1 } },
    },
    lualine_z = {
      { "location", padding = { left = 1, right = 1 } },
    },
  },
})
