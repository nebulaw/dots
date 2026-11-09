local Snacks = require("snacks")
local MiniDiff = require("mini.diff")
local map = vim.keymap.set

-- Signs, hunk staging and navigation. linematch = 0 keeps each hunk whole, as `git diff` shows it
MiniDiff.setup({
  options = { linematch = 0 },
  mappings = {
    goto_next = "]c",
    goto_prev = "[c",
  },
})

-- Overlay that shows each hunk's old lines grouped above its new lines, like `git diff`
local overlay_ns = vim.api.nvim_create_namespace("LivDiffOverlay")

local function render_overlay(buf)
  vim.api.nvim_buf_clear_namespace(buf, overlay_ns, 0, -1)
  local data = MiniDiff.get_buf_data(buf)
  if not (vim.b[buf].liv_diff_overlay and data and data.ref_text) then
    return
  end
  local ref_lines = vim.split(data.ref_text, "\n")
  local width = vim.o.columns
  for _, h in ipairs(data.hunks) do
    if h.ref_count > 0 then
      local virt = {}
      for i = h.ref_start, h.ref_start + h.ref_count - 1 do
        local text = ref_lines[i] or ""
        virt[#virt + 1] = { { text .. string.rep(" ", width - vim.fn.strdisplaywidth(text)), "MiniDiffOverDelete" } }
      end
      local above = h.buf_count > 0 or h.buf_start == 0
      local row = math.max((above and h.buf_start or h.buf_start + 1) - 1, 0)
      row = math.min(row, vim.api.nvim_buf_line_count(buf) - 1)
      vim.api.nvim_buf_set_extmark(buf, overlay_ns, row, 0, { virt_lines = virt, virt_lines_above = true })
    end
    for line = h.buf_start, h.buf_start + h.buf_count - 1 do
      vim.api.nvim_buf_set_extmark(buf, overlay_ns, line - 1, 0, { line_hl_group = "MiniDiffOverAdd" })
    end
  end
end

vim.api.nvim_create_autocmd("User", {
  group = vim.api.nvim_create_augroup("LivDiffOverlay", { clear = true }),
  pattern = "MiniDiffUpdated",
  desc = "Redraw grouped diff overlay",
  callback = function(ev)
    render_overlay(ev.buf)
  end,
})

local function toggle_overlay()
  local buf = vim.api.nvim_get_current_buf()
  vim.b[buf].liv_diff_overlay = not vim.b[buf].liv_diff_overlay
  render_overlay(buf)
end

-- Stage the whole hunk under the cursor (do_hunks alone would stage only the lines in its range)
local function stage_hunk()
  local line = vim.fn.line(".")
  local data = MiniDiff.get_buf_data(0)
  for _, h in ipairs(data and data.hunks or {}) do
    local last = h.buf_start + math.max(h.buf_count, 1) - 1
    if line >= h.buf_start and line <= last then
      return MiniDiff.do_hunks(0, "apply", { line_start = h.buf_start, line_end = last })
    end
  end
  vim.notify("No hunk under cursor", vim.log.levels.WARN)
end

local function stage_file()
  local file = vim.api.nvim_buf_get_name(0)
  if file == "" then
    return vim.notify("Buffer has no file", vim.log.levels.WARN)
  end
  vim.cmd("silent update")
  local res = vim.system({ "git", "add", "--", file }, { cwd = vim.fs.dirname(file) }):wait()
  if res.code ~= 0 then
    return vim.notify("git add failed: " .. vim.trim(res.stderr), vim.log.levels.ERROR)
  end
  vim.notify("Staged " .. vim.fn.fnamemodify(file, ":."))
end

-- Blame only: gitsigns draws nothing in the gutter, mini.diff owns the signs
require("gitsigns").setup({ signcolumn = false })

-- Open the current file as it was in the commit that last changed this line
local function open_blamed_commit()
  local file = vim.api.nvim_buf_get_name(0)
  local line = vim.fn.line(".")
  local res = vim.system(
    { "git", "blame", "--porcelain", "-L", line .. "," .. line, "--", file },
    { cwd = vim.fs.dirname(file) }
  ):wait()
  if res.code ~= 0 then
    return vim.notify("git blame failed: " .. vim.trim(res.stderr), vim.log.levels.ERROR)
  end
  local sha, orig_line = res.stdout:match("^(%x+) (%d+)")
  local path = res.stdout:match("\nfilename ([^\n]+)")
  if not sha or sha:match("^0+$") then
    return vim.notify("Line not committed yet", vim.log.levels.WARN)
  end
  require("gitsigns").show(sha .. ":" .. path, { open = "tabnew" }, function(err)
    if err then
      return vim.notify(err, vim.log.levels.ERROR)
    end
    pcall(vim.api.nvim_win_set_cursor, 0, { tonumber(orig_line), 0 })
  end)
end

require("gitlinker").setup()

map("n", "<leader>gg", function() Liv.lazygit.open() end, { desc = "Lazygit" })
map("n", "<leader>gd", function() Snacks.picker.git_diff() end, { desc = "Git diff hunks" })
map("n", "<leader>gr", function() Snacks.picker.git_branches() end, { desc = "Git branches" })
map("n", "<leader>gl", function() Snacks.picker.git_log() end, { desc = "Git log" })
map("n", "<leader>gS", function() Snacks.picker.git_status() end, { desc = "Git status" })
map("n", "<leader>gv", toggle_overlay, { desc = "Toggle diff overlay" })
map("n", "<leader>gah", stage_hunk, { desc = "Stage hunk" })
map("n", "<leader>gaf", stage_file, { desc = "Stage file" })
map("n", "<leader>gb", function() require("gitsigns").blame_line() end, { desc = "Blame line" })
map("n", "<leader>gB", function() require("gitsigns").blame() end, { desc = "Blame buffer" })
map("n", "<leader>go", open_blamed_commit, { desc = "Open file at blamed commit" })
