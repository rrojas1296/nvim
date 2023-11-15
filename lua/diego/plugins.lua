local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local status_ok, packer = pcall(require, "packer")

if not status_ok then
  return
end

packer.init({
  display = {
    open_fn = function()
      local columns = vim.o.columns
      local lines = vim.o.lines
      local width = math.ceil(columns * 0.4)
      local height = math.ceil(lines * 0.4 - 4)
      local left = math.ceil((columns - width) * 0.5)
      local top = math.ceil((lines - height) * 0.5 - 1)
      return require("packer.util").float({ border = "rounded", width = width, height = height, col = left, row = top })
    end,
  },
})
return packer.startup(function()
  -- Packer
  use("wbthomason/packer.nvim")

  -- Popup
  use("nvim-lua/popup.nvim")

  -- Lualine
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- Themes
  use("sainnhe/sonokai")
  use("sainnhe/everforest")
  use("rose-pine/neovim")
  use("catppuccin/nvim")
  use("Rigellute/rigel")
  use({ "embark-theme/vim", name = "embark" })
  use("haishanh/night-owl.vim")
  use("tomasiser/vim-code-dark")
  use("ghifarit53/tokyonight-vim")
  use('lucasprag/simpleblack')
  use('vv9k/vim-github-dark')
  use("bluz71/vim-moonfly-colors")
  use('ivanlhz/vim-electron')
  use("ericbn/vim-solarized")
  use('overcache/NeoSolarized')
  use('EdenEast/nightfox.nvim')
  use("cormacrelf/vim-colors-github")
  use('ellisonleao/gruvbox.nvim')
  use('nyoom-engineering/oxocarbon.nvim')
  use('craftzdog/solarized-osaka.nvim')

  -- Alpha
  use("goolord/alpha-nvim")

  -- Impatient
  use("lewis6991/impatient.nvim")

  --Which key
  use("folke/which-key.nvim")

  --Telescope
  use("nvim-telescope/telescope.nvim")
  use("nvim-lua/plenary.nvim")
  use("kyazdani42/nvim-web-devicons")

  --Autopairs
  use("windwp/nvim-autopairs")

  use {
  "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    requires = { 
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    }
  }

  --LSP
  use({ "williamboman/mason.nvim" })
  use("williamboman/mason-lspconfig.nvim")
  use("neovim/nvim-lspconfig")
  use('onsails/lspkind-nvim')

  --LSP-Saga
  use({
    'nvimdev/lspsaga.nvim',
    after = 'nvim-lspconfig',
    config = function()
      require('diego.lspsaga')
    end,
  })

  --CMP
  use("hrsh7th/nvim-cmp")             -- The completion plugin
  use('hrsh7th/cmp-nvim-lsp')
  use("hrsh7th/cmp-buffer")           -- buffer completions
  use("hrsh7th/cmp-path")             -- path completions
  use("hrsh7th/cmp-cmdline")          -- cmdline completions
  use("saadparwaiz1/cmp_luasnip")     -- snippet completions
  use("L3MON4D3/LuaSnip")             --snippet engine
  use("rafamadriz/friendly-snippets") -- a bunch of snippets to use
  use("tamago324/nlsp-settings.nvim") -- language server settings defined in json for

  --Indent
  use("lukas-reineke/indent-blankline.nvim")

  --Bufferline
  use("akinsho/bufferline.nvim")

  --Treeseeter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  })

  -- Git
  use("lewis6991/gitsigns.nvim")
  use("tpope/vim-fugitive")

  -- Null Ls
  use("jose-elias-alvarez/null-ls.nvim")

  -- Transparent
  use("xiyaowong/nvim-transparent")

  --Commenter
  use('numToStr/Comment.nvim')
  use('JoosepAlviste/nvim-ts-context-commentstring')

  --ToggleTerm
  use('akinsho/toggleterm.nvim')

  --Flutter Tools
  use {
    'akinsho/flutter-tools.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
  }

  --Flutter snippets
  use('Nash0x7E2/awesome-flutter-snippets')

  -- Packer Sync
  if PACKER_BOOTSTRAP then
    packer.sync()
  end
end)
