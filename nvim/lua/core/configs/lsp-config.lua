-- Lsp Configuration

local nvim_lsp = require("lspconfig")
local util = require("lspconfig/util")
local s1, mason = pcall(require, "mason")
local s2, mason_lsp = pcall(require, "mason-lspconfig")
local s3, mason_null_ls = pcall(require, "mason-null-ls")
local s4, null_ls = pcall(require, "null-ls")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

if not s1 or not s2 then
  return
end

require("vim.lsp.protocol").CompletionItemKind = {
  "", -- Text
  "", -- Method
  "", -- Function
  "", -- Constructor
  "", -- Field
  "", -- Variable
  "", -- Class
  "ﰮ", -- Interface
  "", -- Module
  "", -- Property
  "", -- Unit
  "", -- Value
  "", -- Enum
  "", -- Keyword
  "﬌", -- Snippet
  "", -- Color
  "", -- File
  "", -- Reference
  "", -- Folder
  "", -- EnumMember
  "", -- Constant
  "", -- Struct
  "", -- Event
  "ﬦ", -- Operator
  "", -- TypeParameter
}

local ensure_installed = {
  "cssls",
  "pyright",
  "html",
  "tsserver",
  "jsonls",
  "marksman",
  "tailwindcss",
  "lua_ls",
  "clangd",
}

local augroup = vim.api.nvim_create_augroup("Format", { clear = true })
local format_on_save = function(_, bufnr)
  vim.api.nvim_clear_autocmd({
    group = augroup,
    buffer = bufnr,
  })
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = augroup,
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.format({ bufnr = bufnr, async = false })
    end,
  })
end

local on_attach = function(client, bufnr)
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("Format", { clear = true }),
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.formatting_seq_sync()
      end,
    })
  end
end

local handlers = {
  function(server_name)
    require("lspconfig")[server_name].setup({
      capabilities = capabilities,
    })
  end,
  ["rust_analyzer"] = function()
    nvim_lsp["rust_analyzer"].setup({
      capabilities = capabilities,
      filetypes = { "rust" },
      root_dir = util.root_pattern("Cargo.toml"),
      settings = {
        ["rust_analyzer"] = {
          cargo = {
            allFeatures = true,
          },
        },
      },
    })
  end,
  ["lua_ls"] = function()
    nvim_lsp["lua_ls"].setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = {
              "vim",
              "top",
              "block",
              "use",
              "imap",
              "nmap",
              "vmap",
              "telescope_buffer_dir",
              "imap_remap",
              "nmap_remap",
            },
          },
          workspace = {
            library = {
              [vim.fn.expand("$vimruntime/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        },
      },
    })
  end,
  ["clangd"] = function()
    nvim_lsp["clangd"].setup({
      capabilities = capabilities,
      cmd = { "clangd" },
      filetypes = {
        "c",
        "cpp",
        "objc",
        "objcpp",
        "cuda",
        "proto",
      },
      root_dir = util.root_pattern(
        ".clangd",
        ".clang-tidy",
        ".clang-format",
        "compile_commands.json",
        "compile_flags.txt",
        "configure.ac",
        ".git"
      ),
      single_file_support = true,
    })
  end,
  ["tsserver"] = function()
    nvim_lsp["tsserver"].setup({
      on_attach = format_on_save,
      root_dir = util.root_pattern(".git", "package.json"),
      settings = {
        typescript = {
          inlayHints = {
            includeInlayParameterNameHints = "literal",
            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = false,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayEnumMemberValueHints = true,
          },
        },
        javascript = {
          inlayHints = {
            includeInlayParameterNameHints = "all",
            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayEnumMemberValueHints = true,
          },
        },
      },
      single_file_support = false,
    })
  end,
}

mason.setup()
mason_lsp.setup({
  ensure_installed = ensure_installed,
  automatic_installation = false,
  handlers = handlers,
})
