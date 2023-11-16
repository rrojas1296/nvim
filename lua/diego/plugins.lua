-- Installing Lazy package manager

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local status_ok, lazy = pcall(require, 'lazy')

if not status_ok then
  return
end

lazy.setup({

  -- Popup
  "nvim-lua/popup.nvim",

  -- Lualine
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons', opt = true }
  },

  -- Neodev
  { "folke/neodev.nvim", opts = {} },

  -- Theme
  "catppuccin/nvim",

  -- Alpha
  "goolord/alpha-nvim",

  -- Impatient
  "lewis6991/impatient.nvim",

  --Which key
  "folke/which-key.nvim",

  --Telescope
  "nvim-telescope/telescope.nvim",
  "nvim-lua/plenary.nvim",
  "kyazdani42/nvim-web-devicons",

  --Autopairs
  "windwp/nvim-autopairs",

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    }
  },

  --LSP
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  'onsails/lspkind-nvim',

  --LSP-Saga
  {
    'nvimdev/lspsaga.nvim',
    after = 'nvim-lspconfig',
    config = function()
      require('diego.lspsaga')
    end,
  },

  --CMP
  "hrsh7th/nvim-cmp",             -- The completion plugin
  'hrsh7th/cmp-nvim-lsp',
  "hrsh7th/cmp-buffer",           -- buffer completions
  "hrsh7th/cmp-path",             -- path completions
  "hrsh7th/cmp-cmdline",          -- cmdline completions
  "saadparwaiz1/cmp_luasnip",     -- snippet completions
  "L3MON4D3/LuaSnip",             --snippet engine
  "rafamadriz/friendly-snippets", -- a bunch of snippets to use
  "tamago324/nlsp-settings.nvim", -- language server settings defined in json for

  --Indent
  "lukas-reineke/indent-blankline.nvim",

  --Bufferline
  "akinsho/bufferline.nvim",

  -- Git
  "lewis6991/gitsigns.nvim",
  "tpope/vim-fugitive",

  -- Null Ls
  "jose-elias-alvarez/null-ls.nvim",

  -- Transparent
  "xiyaowong/nvim-transparent",

  --Commenter
  {
    'numToStr/Comment.nvim',
    config = function()
      require('diego.comment')
    end
  },

  --ToggleTerm
  'akinsho/toggleterm.nvim',

  --Flutter Tools
  {
    'akinsho/flutter-tools.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
  },

  --Flutter snippets
  'Nash0x7E2/awesome-flutter-snippets',

  {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end
  }
})
