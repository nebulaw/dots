local status, packer = pcall(require, 'packer')

if not status then return end

vim.cmd [[ packadd packer.nvim ]]

-- PLUGINS
packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  -- Editor
  use 'windwp/nvim-autopairs'
  use 'lewis6991/gitsigns.nvim'
  use 'mg979/vim-visual-multi'
  use 'brenoprata10/nvim-highlight-colors'
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    }
  }
  use 'nvim-lua/plenary.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    'nvim-telescope/telescope-file-browser.nvim',
  }
  use "folke/trouble.nvim"
  use "RRethy/vim-illuminate"

  -- LSP
  use 'onsails/lspkind.nvim'
  use {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
  }
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'

  -- Themes
  use 'rktjmp/lush.nvim'
  use 'metalelf0/jellybeans-nvim'
  use 'xiyaowong/transparent.nvim'
  use 'craftzdog/solarized-osaka.nvim'

  -- TreeSitter
  use 'nvim-treesitter/nvim-treesitter'
  use "windwp/nvim-ts-autotag"
  use 'p00f/nvim-ts-rainbow'

  -- UI
  use "echasnovski/mini.indentscope"
  use 'nvim-lualine/lualine.nvim'
  use "lukas-reineke/indent-blankline.nvim"
end)

