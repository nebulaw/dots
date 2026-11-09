local group = vim.api.nvim_create_augroup("LivAutocmds", { clear = true })

vim.api.nvim_create_autocmd("BufReadPost", {
  group = group,
  desc = "Jump to the last cursor position when reopening a file",
  callback = function(ev)
    local line = vim.api.nvim_buf_get_mark(ev.buf, '"')[1]
    if line > 1 and line <= vim.api.nvim_buf_line_count(ev.buf) then
      vim.cmd('normal! g`"')
    end
  end,
})

vim.api.nvim_create_autocmd({ "VimEnter", "WinEnter", "BufWinEnter" }, {
  group = group,
  desc = "Show cursorline in the active window",
  callback = function()
    vim.wo.cursorline = true
  end,
})

vim.api.nvim_create_autocmd("WinLeave", {
  group = group,
  desc = "Hide cursorline in inactive windows",
  callback = function()
    vim.wo.cursorline = false
  end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
  group = group,
  desc = "Briefly highlight yanked text",
  callback = function()
    vim.hl.on_yank()
  end,
})
