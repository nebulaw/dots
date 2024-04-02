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
require("conform").setup({
  formatters_by_ft = {
    ["lua"] = { "stylua" },
    ["python"] = { "isort", "black" },
    ["javascript"] = { "prettier" },
    ["javascriptreact"] = { "prettier" },
    ["typescript"] = { "prettier" },
    ["typescriptreact"] = { "prettier" },
    ["vue"] = { "prettier" },
    ["css"] = { "prettier" },
    ["scss"] = { "prettier" },
    ["less"] = { "prettier" },
    ["html"] = { "prettier" },
    ["json"] = { "prettier" },
    ["yaml"] = { "prettier" },
    ["markdown"] = { "prettier" },
    ["markdown.mdx"] = { "prettier" },
    ["graphql"] = { "prettier" },
    ["handlebars"] = { "prettier" },
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

mason.setup()
mason_lsp.setup({
  ensure_installed = servers,
  automatic_installation = false,
  handlers = {
    function(server_name)
      require("lspconfig")[server_name].setup({
        capabilities = capabilities,
        -- This formats file if formatter is provided
        on_attach = function(client, bufnr)
          if client.server_capabilities.documentFormattingProvider then
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = vim.api.nvim_create_augroup("Format", { clear = true }),
              buffer = bufnr,
              callback = function()
                require("conform").format({ bufnr = bufnr })
              end,
            })
          end
        end,
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

require("lspsaga").setup({
  -- options
  request_timeout = 5000,

  -- preview
  preview = {
    line_above = 2,
    line_below = 8,
  },
  -- scroll preview
  scroll_preview = {
    scroll_down = "<c-d>",
    scroll_up = "<c-u>",
  },
  -- diagnostics
  diagnostics = {
    on_insert_follow = true,
    show_code_action = true,
    max_width = 0.6,
    keys = {
      exec_action = "o",
      quit = "q",
      go_action = "g",
    },
  },
  -- definition
  definition = {
    edit = "<c-c>e",
    quit = "q",
  },
  -- rename
  rename = {
    quit = "q",
    exec = "<CR>",
    mark = "x",
    confirm = "<CR>",
    in_select = true,
  },
  -- code actions
  code_action_prompt = {
    enable = true,
    sign = true,
    sign_priority = 20,
    virtual_text = true,
  },
  -- outline
  outline = {
    win_position = "right",
    win_with = "",
    win_width = 25,
    show_detail = true,
    auto_preview = true,
  },
  -- finder
  finder = {
    height = 0.4,
    keys = {
      jump_to = "o",
      edit = { "e", "<CR>" },
      vsplit = "s",
      split = "i",
      tabe = "t",
      tabnew = "T",
      quit = { "q", "quit" },
    },
  },
  -- lightbulb
  lightbulb = {
    enable = false,
    enable_in_insert = false,
    sign = true,
    sign_priority = 40,
    virtual_text = false,
  },
})

-- diagnostics
-- nmap('<leader>dp','<cmd>Lspsaga diagnostics_jump_prev<CR>')
-- nmap('<leader>dn','<cmd>Lspsaga diagnostics_jump_next<CR>')
vim.keymap.set("n", "<leader>db", "<cmd>Lspsaga show_buf_diagnostics<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>dl", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true, noremap = true })

-- code actions
vim.keymap.set("n", "ca", "<cmd>Lspsaga code_action<CR>", { silent = true, noremap = true })

-- goto
vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "gp", "<cmd>Lspsaga peek_definition<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "gt", "<cmd>Lspsaga goto_type_definition<CR>", { silent = true, noremap = true })

-- rename
vim.keymap.set("n", "<leader>r", "<cmd>Lspsaga rename<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>p", "<cmd>Lspsaga rename ++project<CR>", { silent = true, noremap = true })

-- docs
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "}", "<cmd>Lspsaga hover_doc ++keep<CR>", { silent = true, noremap = true })

-- outline
vim.keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>", { silent = true, noremap = true })

-- finder
vim.keymap.set("n", "<leader>lf", "<cmd>Lspsaga finder<CR>", { silent = true, noremap = true })
