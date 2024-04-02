-- Git Signs
require("gitsigns").setup({
  signs = {
    add = { text = "▎" },
    change = { text = "▎" },
    delete = { text = "" },
    topdelete = { text = "" },
    changedelete = { text = "▎" },
    untracked = { text = "▎" },
  },
})

-- Telescope
require("telescope").setup({
  defaults = {
    mappings = {
      n = {
        ["q"] = require("telescope.actions").close,
      },
    },
    file_ignore_patterns = {
      "node_modules/",
      "target/",
    },
    layout_config = {
      height = 0.8,
      width = 0.9,
      preview_cutoff = 130,
      prompt_position = "bottom",
    },
    border = true,
  },
  extensions = {
    file_browser = {
      theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          ["<C-w>"] = function()
            vim.cmd([[normal vbd]])
          end,
        },
        ["n"] = {
          ["/"] = function()
            vim.cmd([[startinsert]])
          end,
        },
      },
    },
  },
})

local bi = require("telescope.builtin")
local kset = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Load Telescope Extensions
require("telescope").load_extension("file_browser")

-- KEYMAPS

-- diagnostics
kset("n", "<space>dd", bi.diagnostics, opts)

-- git (disable temporarily)
kset("n", "<space>gf", bi.git_files, opts)
kset("n", "<space>gs", bi.git_status, opts)
kset("n", "<space>gb", bi.git_branches, opts)
kset("n", "<space>gc", bi.git_commits, opts)

-- file browser
kset("n", "<space><space>", bi.find_files, opts)
kset("n", "<space>fo", bi.oldfiles, opts)
kset("n", "<space>ff", function()
  require("telescope").extensions.file_browser.file_browser({
    path = "%:p:h",
    cwd = vim.fn.expand("%:p:h"),
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    previewer = false,
    initial_mode = "normal",
    layout_config = {
      height = 40,
    },
  })
end, opts)
kset("n", "<space>bb", bi.buffers, { noremap = true, silent = true })

-- search in files
kset("n", "<space>ll", bi.live_grep, opts)

-- colorschemes
kset("n", "<space>cs", bi.colorscheme, opts)

-- Trouble
require("trouble").setup({
  use_diagnostic_signs = true,
})

-- Illuminate
require("illuminate").configure({
  delay = 320,
  large_file_cutoff = 5000,
})
