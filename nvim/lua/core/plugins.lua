local status, packer = pcall(require, 'packer')

if not status then return end

vim.cmd [[ packadd packer.nvim ]]

-- PLUGINS
packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  -- UTILS
  use 'dinhhuy258/git.nvim'
  use 'windwp/nvim-autopairs'
  use 'lewis6991/gitsigns.nvim'
  use 'windwp/nvim-ts-autotag'
  use 'p00f/nvim-ts-rainbow'
  use 'mg979/vim-visual-multi'
  use 'brenoprata10/nvim-highlight-colors'

  -- LSP
  use 'onsails/lspkind.nvim'
  use {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
  }
  use "stevearc/conform.nvim"
  use 'glepnir/lspsaga.nvim'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'rafamadriz/friendly-snippets'
  use 'nvim-treesitter/nvim-treesitter'

  -- INTERFACE
  use 'akinsho/nvim-bufferline.lua'
  use 'nvim-tree/nvim-tree.lua'
  use 'voldikss/vim-floaterm'
  use 'nvim-tree/nvim-web-devicons'
  use 'nvim-lualine/lualine.nvim'
  use 'nvim-lua/plenary.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    'nvim-telescope/telescope-file-browser.nvim',
  }

  -- THEMES
  use 'rebelot/kanagawa.nvim'
  use {
    'svrana/neosolarized.nvim',
    requires = {
      'tjdevries/colorbuddy.nvim',
    }
  }
  use 'owickstrom/vim-colors-paramount'
  use 'barrientosvctor/abyss.nvim'
  use 'rktjmp/lush.nvim'
  use 'metalelf0/jellybeans-nvim'
  use 'xiyaowong/transparent.nvim'
end)

