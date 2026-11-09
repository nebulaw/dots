local conform = require("conform")

local prettier = { "prettierd", "prettier", stop_after_first = true }

local formatters_by_ft = {
  lua = { "stylua" },
  python = { "isort", "black" },
  sh = { "shfmt" },
}
for _, ft in ipairs({
  "css",
  "html",
  "javascript",
  "javascriptreact",
  "json",
  "less",
  "markdown",
  "markdown.mdx",
  "scss",
  "typescript",
  "typescriptreact",
  "yaml",
}) do
  formatters_by_ft[ft] = prettier
end

conform.setup({
  formatters_by_ft = formatters_by_ft,
  default_format_opts = {
    timeout_ms = 3000,
    lsp_format = "fallback",
  },
  formatters = {
    -- Sort imports the way black formats them, so the two do not undo each other
    isort = { prepend_args = { "--profile", "black" } },
  },
  format_on_save = function()
    if vim.g.disable_autoformat then
      return
    end
    -- Room for prettierd's first start; warm formats take ~60 ms
    return { timeout_ms = 2000, lsp_format = "fallback" }
  end,
})

vim.api.nvim_create_user_command("ToggleFormatter", function()
  vim.g.disable_autoformat = not vim.g.disable_autoformat
  vim.notify("Format on save " .. (vim.g.disable_autoformat and "disabled" or "enabled"))
end, { desc = "Toggle format on save for all buffers" })

vim.keymap.set({ "n", "x" }, "<leader>ff", function()
  conform.format()
end, { desc = "Format file or selection" })
