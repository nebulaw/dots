local status, packer = pcall(require, "packer")

if not status then
  return
end

vim.cmd([[ packadd packer.nvim ]])

-- PLUGINS
packer.startup(function(use)
  use("wbthomason/packer.nvim")

  -- Utils
  use("nvim-lua/plenary.nvim")
  use("nvim-tree/nvim-web-devicons")
  use("echasnovski/mini.pairs")
  use("echasnovski/mini.comment")
  use("JoosepAlviste/nvim-ts-context-commentstring")
  use("brenoprata10/nvim-highlight-colors")
  use("mg979/vim-visual-multi")
  use("folke/todo-comments.nvim")

  -- Editor
  use("akinsho/bufferline.nvim")
  use("lewis6991/gitsigns.nvim")
  use({
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    requires = {
      "MunifTanjim/nui.nvim",
    },
  })
  use({
    "nvim-telescope/telescope.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
  })
  use("folke/trouble.nvim")
  use("RRethy/vim-illuminate")

  -- Snippets
  use("L3MON4D3/LuaSnip")
  use("rafamadriz/friendly-snippets")

  -- LSP
  use({
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  })
  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-nvim-lsp")
  use("stevearc/conform.nvim")
  -- use("mfussenegger/nvim-lint")

  -- Themes
  use("rktjmp/lush.nvim")
  use("metalelf0/jellybeans-nvim")
  use("xiyaowong/transparent.nvim")
  use("craftzdog/solarized-osaka.nvim")

  -- TreeSitter
  use("nvim-treesitter/nvim-treesitter")
  use("windwp/nvim-ts-autotag")
  use("p00f/nvim-ts-rainbow")

  -- UI
  use("echasnovski/mini.indentscope")
  use("nvim-lualine/lualine.nvim")
  use("lukas-reineke/indent-blankline.nvim")
end)
