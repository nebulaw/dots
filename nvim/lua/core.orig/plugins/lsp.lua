local servers = {
  "cssls", "pyright", "html", "jsonls", "marksman",
  "tailwindcss", "lua_ls", "clangd", "vtsls",
}

return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
    opts = {},
  },

  {
    "williamboman/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
    config = function()
      local lspconfig = require("lspconfig")
      local util = require("lspconfig/util")

      require("mason-lspconfig").setup({
        ensure_installed = servers,
        automatic_installation = false,
        handlers = {
          function(server_name)
            lspconfig[server_name].setup({
              capabilities = require("blink.cmp").get_lsp_capabilities(),
            })
          end,
          ["pyright"] = function()
            lspconfig.pyright.setup({
              capabilities = require("blink.cmp").get_lsp_capabilities(),
              settings = {
                python = {
                  analysis = {
                    autoSearchPaths = true,
                    useLibraryCodeForTypes = true,
                    diagnosticMode = "workspace",
                    typeCheckingMode = "basic",
                  },
                },
              },
            })
          end,
          ["lua_ls"] = function()
            lspconfig.lua_ls.setup({
              capabilities = require("blink.cmp").get_lsp_capabilities(),
              settings = {
                Lua = {
                  diagnostics = { globals = { "vim" } },
                  workspace = {
                    library = {
                      [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                      [vim.fn.stdpath("config") .. "/lua"] = true,
                    },
                  },
                },
              },
            })
          end,
          ["clangd"] = function()
            lspconfig.clangd.setup({
              capabilities = require("blink.cmp").get_lsp_capabilities(),
              cmd = { "clangd", "--offset-encoding=utf-16" },
              filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
              root_dir = util.root_pattern(".clangd", ".clang-format", ".clang-tidy", "compile_commands.json", "compile_flags.txt", "configure.ac", ".git"),
              single_file_support = true,
              init_options = {
                compilationDatabasePath = "build",
              },
            })
          end,
          ["vtsls"] = function()
            lspconfig.vtsls.setup({
              capabilities = require("blink.cmp").get_lsp_capabilities(),
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
              single_file_support = true,
            })
          end,
        },
      })
    end,
  },

  { "neovim/nvim-lspconfig", lazy = true },

  {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    opts = {
      request_timeout = 5000,
      preview = { line_above = 2, line_below = 8 },
      scroll_preview = { scroll_down = "<c-d>", scroll_up = "<c-u>" },
      diagnostics = { on_insert_follow = true, show_code_action = true, max_width = 0.6 },
      definition = { edit = "<c-c>e", quit = "q" },
      rename = { quit = "<c-q>", exec = "<cr>", mark = "x", confirm = "<cr>", in_select = true },
      outline = { win_position = "right", win_with = "", win_width = 30, show_detail = true, auto_preview = true },
      finder = { height = 0.4, keys = { jump_to = "o", edit = { "e", "<CR>" }, vsplit = "s", split = "i", tabe = "t", tabnew = "T", quit = { "q", "quit" } } },
      lightbulb = { enable = false, enable_in_insert = false, sign = true, sign_priority = 40, virtual_text = false },
    },
    keys = {
      { "gd", "<cmd>Lspsaga goto_definition<cr>", desc = "Goto Definition" },
      { "gp", "<cmd>Lspsaga peek_definition<cr>", desc = "Peek Definition" },
      { "gt", "<cmd>Lspsaga goto_type_definition<cr>", desc = "Goto Type Definition" },
      { "ca", "<cmd>Lspsaga code_action<cr>", desc = "Code Action" },
      { "K", "<cmd>Lspsaga hover_doc<cr>", desc = "Hover Doc" },
      { "}", "<cmd>Lspsaga hover_doc ++keep<cr>", desc = "Hover Doc Keep" },
      { "<leader>r", "<cmd>Lspsaga rename<cr>", desc = "Rename" },
      { "<leader>p", "<cmd>Lspsaga rename ++project<cr>", desc = "Rename Project" },
      { "<leader>o", "<cmd>Lspsaga outline<cr>", desc = "Outline" },
      { "<leader>lf", "<cmd>Lspsaga finder<cr>", desc = "Finder" },
      { "<leader>db", "<cmd>Lspsaga show_buf_diagnostics<cr>", desc = "Buffer Diagnostics" },
      { "<leader>dl", "<cmd>Lspsaga show_line_diagnostics<cr>", desc = "Line Diagnostics" },
    },
  },

  {
    "saghen/blink.cmp",
    event = "InsertEnter",
    dependencies = { "rafamadriz/friendly-snippets", "L3MON4D3/LuaSnip" },
    version = "1.*",
    opts = {
      keymap = {
        preset = "default",
        ["<Tab>"] = { "select_and_accept", "snippet_forward", "fallback" },
        ["<C-b>"] = { "scroll_documentation_up", "fallback" },
        ["<C-f>"] = { "scroll_documentation_down", "fallback" },
        ["<C-o>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-e>"] = { "cancel", "fallback" },
        ["<CR>"] = { "accept", "fallback" },
      },
      appearance = { nerd_font_variant = "mono" },
      completion = {
        documentation = { auto_show = true, auto_show_delay_ms = 200 },
        menu = { draw = { columns = { { "kind_icon" }, { "label", "label_description", gap = 1 } } } },
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
      signature = { enabled = true },
      snippets = { preset = "luasnip" },
    },
  },

  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    cmd = "ConformInfo",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
      },
      format_on_save = { timeout_ms = 500, lsp_fallback = true },
    },
  },

  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },

  { "L3MON4D3/LuaSnip", lazy = true, build = "make install_jsregexp" },
  { "rafamadriz/friendly-snippets", lazy = true },
}
