return {
  { "nvim-lua/plenary.nvim", lazy = true },
  { "nvim-tree/nvim-web-devicons", lazy = true },
  { "MunifTanjim/nui.nvim", lazy = true },

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    cmd = "Neotree",
    keys = {
      { "<space>e", "<cmd>Neotree toggle<cr>", desc = "Explorer" },
    },
    dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" },
    opts = {
      sources = { "filesystem", "buffers", "git_status", "document_symbols" },
      open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
      filesystem = {
        bind_to_cwd = true,
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
      },
      window = {
        position = "left",
        width = 32,
        mappings = {
          ["<space>"] = "none",
          ["Y"] = function(state)
            local node = state.tree:get_node()
            vim.fn.setreg("+", node:get_id(), "c")
          end,
        },
      },
      default_component_configs = {
        indent = {
          with_expanders = true,
          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "NeoTreeExpander",
        },
      },
    },
  },

  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    keys = {
      { "<space><space>", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      { "<space>ll", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
      { "<space>bb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<space>fo", "<cmd>Telescope oldfiles<cr>", desc = "Old Files" },
      { "<space>cs", "<cmd>Telescope colorscheme<cr>", desc = "Colorschemes" },
      { "<space>dd", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
      { "<space>gf", "<cmd>Telescope git_files<cr>", desc = "Git Files" },
      { "<space>gs", "<cmd>Telescope git_status<cr>", desc = "Git Status" },
      { "<space>gb", "<cmd>Telescope git_branches<cr>", desc = "Git Branches" },
      { "<space>gc", "<cmd>Telescope git_commits<cr>", desc = "Git Commits" },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-file-browser.nvim" },
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        defaults = {
          mappings = { n = { ["q"] = require("telescope.actions").close } },
          file_ignore_patterns = { "node_modules/", "target/", "venv/" },
          layout_config = { height = 0.8, width = 0.9, preview_cutoff = 130, prompt_position = "bottom" },
          border = true,
        },
        extensions = {
          file_browser = {
            theme = "ivy",
            hijack_netrw = true,
            mappings = {
              ["i"] = { ["<C-w>"] = function() vim.cmd([[normal vbd]]) end },
              ["n"] = { ["/"] = function() vim.cmd([[startinsert]]) end },
            },
          },
        },
      })
      telescope.load_extension("file_browser")
      vim.keymap.set("n", "<space>ff", function()
        telescope.extensions.file_browser.file_browser({
          path = "%:p:h", cwd = vim.fn.expand("%:p:h"), respect_gitignore = false,
          hidden = true, grouped = true, previewer = false, initial_mode = "normal",
          layout_config = { height = 40 },
        })
      end, { noremap = true, silent = true, desc = "File Browser" })
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
    },
  },

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    },
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      spec = {
        { "<leader>b", group = "buffer" },
        { "<leader>c", group = "copilot" },
        { "<leader>d", group = "diagnostics" },
        { "<leader>g", group = "git" },
        { "<leader>l", group = "lsp" },
      },
    },
  },

  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    keys = {
      { "<space>t", "<cmd>Trouble diagnostics<cr>", desc = "Diagnostics" },
    },
    opts = { use_diagnostic_signs = true },
  },

  {
    "RRethy/vim-illuminate",
    event = { "BufReadPost", "BufNewFile" },
    opts = { delay = 320, large_file_cutoff = 5000 },
    config = function(_, opts) require("illuminate").configure(opts) end,
  },

  {
    "folke/todo-comments.nvim",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },

  { "mg979/vim-visual-multi", event = { "BufReadPost", "BufNewFile" } },
}
