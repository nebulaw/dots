local nvim_lsp = require("lspconfig")
local m_status, mason = pcall(require, "mason")
local ml_status, mason_lsp = pcall(require, "mason-lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local util = require("lspconfig/util")

if not m_status or not ml_status then
  return
end

local servers = {
  "cssls",
  "pyright",
  "html",
  "jsonls",
  "marksman",
  "vtsls",
  "tailwindcss",
  "lua_ls",
  "clangd",
}

-- Linting
-- require("lint").linters_by_ft = {
--   markdown = { "vale" },
--   javascript = { "biome" },
--   typescript = { "biome" },
--   json = { "biome" },
-- }
--
-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
--   -- pattern = "*.jsx,*.tsx,*.js,*.ts",
--   pattern = "*",
--   callback = function()
--     require("lint").try_lint()
--   end,
-- })

-- Formatting the file
-- local format_augroup = vim.api.nvim_create_augroup("Format", { clear = true })
-- local format_on_save = function(_, bufnr)
--   vim.api.nvim_clear_autocmd({
--     group = format_augroup,
--     buffer = bufnr,
--   })
--   vim.api.nvim_create_autocmd("BufWritePre", {
--     group = format_augroup,
--     buffer = bufnr,
--     callback = function()
--       vim.lsp.buf.format({ bufnr = bufnr, async = false })
--     end,
--   })
-- end

require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "isort", "black" },
    javascript = { { "prettier", "prettierd" } },
    typescript = { { "prettier", "prettierd" } },
  },
  format_on_save = {
    timeout_ms = 500,
    async = false,
    quiet = false,
    lsp_fallback = true,
  },
  formatters = {
    injected = { options = { ignore_errors = true } },
  },
})

local on_attach = function(client, bufnr)
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("Format", { clear = true }),
      buffer = bufnr,
      callback = function()
        require("conform").format({ bufnr = bufnr })
      end,
    })
  end
end

mason.setup()
mason_lsp.setup({
  ensure_installed = servers,
  automatic_installation = false,
  handlers = {
    function(server_name)
      require("lspconfig")[server_name].setup({
        capabilities = capabilities,
        on_attach = on_attach,
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
  },
})

require("luasnip.loaders.from_vscode").lazy_load()

-- TODO: These abilities will be replaced by lspsaga
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    local opts = { buffer = ev.buf }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set("n", "<space>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<space>f", function()
      vim.lsp.buf.format({ async = true })
    end, opts)
  end,
})
