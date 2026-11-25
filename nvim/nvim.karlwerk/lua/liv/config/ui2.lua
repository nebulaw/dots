vim.o.cmdheight = 1 -- Always show the command line row

-- Built-in experimental message and cmdline UI (Neovim 0.12, private API)
require("vim._core.ui2").enable({
  enable = true,
  msg = {
    target = "msg",
    targets = {
      list_cmd = "pager",
      lua_error = "pager",
      rpc_error = "pager",
      shell_out = "pager",
      shell_err = "pager",
      verbose = "pager",
    },
    msg = { timeout = 4000 },
  },
})
