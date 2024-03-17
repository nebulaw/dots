-- Nvim-Tree

local status, nvim_tree = pcall(require, 'nvim-tree')

if not status then return end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

nvim_tree.setup({
  disable_netrw = true,
  hijack_netrw = true,
  open_on_tab = true,
  hijack_cursor = true,
  update_cwd = true,
  view = {
    --    width = 20,
    side = 'left',
    centralize_selection = false,
  },
  diagnostics = {
    enable = true,
    show_on_dirs = false,
    show_on_open_dirs = false,
    debounce_delay = 100,
    severity = {
      min = vim.diagnostic.severity.HINT,
      max = vim.diagnostic.severity.ERROR,
    },
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
})

nmap('<SPACE>e', ':NvimTreeToggle<CR>')
