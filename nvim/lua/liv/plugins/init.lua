local function gh(repo)
  return "https://github.com/" .. repo
end

-- Post-install/update hooks keyed by plugin name; registered before vim.pack.add so no event is missed
local hooks = {
  ["nvim-treesitter"] = function(ev)
    if ev.data.kind == "update" then
      vim.cmd("TSUpdate")
    end
  end,
  ["mason.nvim"] = function(ev)
    if ev.data.kind == "update" then
      vim.cmd("MasonUpdate")
    end
  end,
}

vim.api.nvim_create_autocmd("PackChanged", {
  group = vim.api.nvim_create_augroup("LivPackHooks", { clear = true }),
  desc = "Run plugin build hooks",
  callback = function(ev)
    local hook = hooks[ev.data.spec.name]
    if hook then
      hook(ev)
    end
  end,
})

vim.pack.add({
  -- UI
  gh("rktjmp/lush.nvim"),
  gh("metalelf0/jellybeans-nvim"),
  gh("nvim-mini/mini.icons"),
  gh("folke/snacks.nvim"),
  -- Editor
  { src = gh("nvim-treesitter/nvim-treesitter"), version = "main" },
  gh("mks-h/treesitter-autoinstall.nvim"),
  { src = gh("saghen/blink.cmp"), version = vim.version.range("^1") },
  gh("stevearc/conform.nvim"),
  gh("nvim-mini/mini.pairs"),
  gh("JoosepAlviste/nvim-ts-context-commentstring"),
  gh("nvim-mini/mini.comment"),
  gh("nvim-mini/mini.surround"),
  gh("brenoprata10/nvim-highlight-colors"),
  gh("nvim-lua/plenary.nvim"),
  gh("folke/todo-comments.nvim"),
  gh("mg979/vim-visual-multi"),
  -- Git
  gh("nvim-mini/mini.diff"),
  gh("lewis6991/gitsigns.nvim"),
  gh("linrongbin16/gitlinker.nvim"),
  -- Statusline
  gh("nvim-lualine/lualine.nvim"),
  -- Tabs
  gh("b0o/incline.nvim"),
  -- LSP
  gh("neovim/nvim-lspconfig"),
  gh("mason-org/mason.nvim"),
  gh("WhoIsSethDaniel/mason-tool-installer.nvim"),
  -- Util
  gh("stevearc/oil.nvim"),
})

require("liv.plugins.ui")
require("liv.plugins.treesitter")
require("liv.plugins.snacks")
require("liv.plugins.explorer")
require("liv.plugins.completion")
require("liv.plugins.formatting")
require("liv.plugins.editor")
require("liv.plugins.git")
require("liv.plugins.statusline")
require("liv.plugins.tabs")
require("liv.plugins.lsp")
require("liv.plugins.lsp_keymaps")
