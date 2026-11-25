-- Mason puts its bin directory first on PATH; servers not listed here come from the system
require("mason").setup()
require("mason-tool-installer").setup({
  ensure_installed = {
    "css-lsp",
    "eslint-lsp",
    "glsl_analyzer",
    "html-lsp",
    "json-lsp",
    "lua-language-server",
    "marksman",
    "pyright",
    "tailwindcss-language-server",
    "vtsls",
    -- Formatters
    "black",
    "isort",
    "prettier",
    "prettierd",
    "shfmt",
    "stylua",
  },
  auto_update = false,
  run_on_start = true,
})

vim.lsp.config("*", {
  capabilities = require("blink.cmp").get_lsp_capabilities({
    workspace = {
      fileOperations = {
        didRename = true,
        willRename = true,
      },
    },
  }),
})

vim.lsp.enable({
  "clangd", -- system: Xcode command line tools
  "cssls",
  "eslint", -- lint only; starts in projects with an eslint config
  "glsl_analyzer",
  "html",
  "jsonls",
  "lua_ls",
  "marksman",
  "pyright",
  "rust_analyzer", -- system: rustup component
  "tailwindcss",
  "vtsls",
})
