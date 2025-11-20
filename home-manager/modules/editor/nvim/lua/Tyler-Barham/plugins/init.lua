local uv = vim.uv or vim.loop

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not uv.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '
vim.g.maplocalleader = '/'

local plugins = {
  -- Auto handlers
  {
    'rmagatti/auto-session',
    config = function()
      require('Tyler-Barham.plugins.auto-session')
    end,
  },
  {
    'chrisgrieser/nvim-early-retirement',
    config = function()
      require('Tyler-Barham.plugins.early-retirement')
    end,
  },

  -- Movement
  -- {
  --   'm4xshen/hardtime.nvim',
  --   dependencies = {
  --     'MunifTanjim/nui.nvim',
  --     'nvim-lua/plenary.nvim',
  --   },
  --   config = function()
  --     require('Tyler-Barham.plugins.hardtime')
  --   end,
  -- },
  -- {
  --   'ThePrimeagen/harpoon',
  --   dependencies = {
  --     'nvim-lua/plenary.nvim',
  --   },
  --   config = function()
  --     require('Tyler-Barham.plugins.harpoon')
  --   end,
  -- },

  -- cmp
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  {
    'L3MON4D3/LuaSnip',
    version = 'v1.*',
    config = function()
      require('Tyler-Barham.plugins.lua-snip')
    end,
  },
  'saadparwaiz1/cmp_luasnip',

  -- Code
  'neovim/nvim-lspconfig',
  {
    'stevearc/conform.nvim',
    config = function()
      require('Tyler-Barham.plugins.conform')
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/nvim-treesitter-context',
    },
    build = ':TSUpdateSync',
    config = function()
      require('Tyler-Barham.plugins.treesitter')
    end,
  },
  'mfussenegger/nvim-dap',
  {
    'rcarriga/nvim-dap-ui',
    dependencies = {
      'mfussenegger/nvim-dap',
      'nvim-neotest/nvim-nio',
    },
    config = function()
      require('Tyler-Barham.plugins.dap')
    end,
  },
  'jbyuki/one-small-step-for-vimkind',
  'andymass/vim-matchup',
  'windwp/nvim-autopairs',
  'tpope/vim-surround',
  'fedorenchik/qt-support.vim',
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
  },

  -- UI enhance
  {
    'stevearc/dressing.nvim',
    config = function()
      require('Tyler-Barham.plugins.dressing')
    end,
  },
  {
    'lewis6991/gitsigns.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require('Tyler-Barham.plugins.gitsigns')
    end,
  },
  {
    'nmac427/guess-indent.nvim',
    config = function()
      require('Tyler-Barham.plugins.guess-indent')
    end,
  },
  'onsails/lspkind.nvim',
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    config = function()
      require('Tyler-Barham.plugins.indent-blankline')
    end,
  },
  {
    'nvimdev/hlsearch.nvim',
    config = function()
      require('hlsearch').setup()
    end
  },
  {
    "sphamba/smear-cursor.nvim",
    config = function()
      require('Tyler-Barham.plugins.smear-cursor')
    end
  },

  -- UI components
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    config = function()
      require('Tyler-Barham.plugins.neo-tree')
    end,
  },
  {
    'folke/trouble.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('Tyler-Barham.plugins.trouble')
    end,
  },
  {
    'folke/noice.nvim',
    dependencies = {
      'MunifTanjim/nui.nvim',
      {
        'rcarriga/nvim-notify',
        config = function()
          require('Tyler-Barham.plugins.notify')
        end,
      },
    },
    config = function()
      require('Tyler-Barham.plugins.noice')
    end,
  },
  {
    'nvim-telescope/telescope.nvim',
    version = '0.1.x',
    dependencies = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require('Tyler-Barham.plugins.telescope')
    end,
  },
  'nvim-telescope/telescope-ui-select.nvim',
  {
    'MagicDuck/grug-far.nvim',
    config = function()
      require('Tyler-Barham.plugins.grug-far')
    end
  },

  -- Util
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('Tyler-Barham.plugins.toggleterm')
    end,
  },
  {
    'Tyler-Barham/floating-help.nvim',
    -- dir = '~/Code/Personal/floating-help.nvim',
    config = function()
      require('Tyler-Barham.plugins.floating-help')
    end,
  },

  {
    'ellisonleao/gruvbox.nvim',
    dependencies = {
      'nvim-lualine/lualine.nvim',
    },
    config = function()
      require('Tyler-Barham.themes.theme-selector').init_theme()
    end,
    priority = 25,
  },

  {
    'mawkler/modicator.nvim',
    dependencies = {
      'ellisonleao/gruvbox.nvim',
      'nvim-lualine/lualine.nvim',
    },
    config = function()
      require('Tyler-Barham.plugins.modicator')
    end,
  }
}

local opts = {
  defaults = { lazy = false },
  ui = { border = 'rounded' },
  rocks = {
    enabled = false,
    hererocks = false,
  },
  lockfile = "~/.config/home-manager/editor/nvim/lazy-lock.json",
}

require('lazy').setup(plugins, opts)
--vim.cmd('runtime! lua/Tyler-Barham/plugins/*.lua')
