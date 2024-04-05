-- Bufferline
require("bufferline").setup({
  options = {
    mode = "tabs", -- also: buffers, tabs
    themable = true,
    separator_style = "slant", -- also: slope, thick, thin, slant
    diagnostics = "nvim_lsp",
    always_show_bufferline = false,
    offsets = {
      {
        filetype = "neo-tree",
        text = "Explorer",
        highlight = "Directory",
        text_align = "left",
      },
    },
  },
})

-- Lualine
require("lualine").setup({
  options = {
    theme = "auto",
    globalstatus = true,
    disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch" },
    lualine_c = {
      {
        "diagnostics",
        symbols = {
          error = " ",
          warn = " ",
          info = " ",
          hint = " ",
        },
      },
      { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
    },
    lualine_y = {
      { "progress", separator = " ", padding = { left = 1, right = 0 } },
      { "location", padding = { left = 0, right = 1 } },
    },
    lualine_z = {},
  },
  extensions = { "neo-tree", "lazy" },
})

-- Indentscope
require("mini.indentscope").setup({
  symbol = "│",
  draw = {
    delay = 100,
  },
  options = { try_as_border = true },
})

-- Indent Blankline
require("ibl").setup({
  indent = {
    char = "│",
    tab_char = "│",
  },
  scope = { enabled = false },
  exclude = {
    filetypes = {
      "help",
      "alpha",
      "dashboard",
      "neo-tree",
      "Trouble",
      "trouble",
      "lazy",
      "mason",
      "notify",
      "toggleterm",
      "lazyterm",
    },
  },
})

-- Neotree
require("neo-tree").setup({
  sources = { "filesystem", "buffers", "git_status", "document_symbols" },
  open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
  filesystem = {
    bind_to_cwd = true,
    follow_current_file = { enabled = true },
    use_libuv_file_watcher = true,
  },
  window = {
    width = 32,
    mappings = {
      ["<space>"] = "none",
      ["Y"] = {
        function(state)
          local node = state.tree:get_node()
          local path = node:get_id()
          vim.fn.setreg("+", path, "c")
        end,
        desc = "copy path to clipboard",
      },
    },
  },
  default_component_configs = {
    indent = {
      with_expanders = true,
      expander_collapsed = "",
      expander_expanded = "",
      expander_highlight = "NeoTreeExpander",
    },
  },
})

-- keymaps
vim.api.nvim_set_keymap("n", "<space>e", "<cmd>Neotree toggle<return>", { noremap = false, silent = true })
