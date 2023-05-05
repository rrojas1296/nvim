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
      return require("packer.util").float({ border = "rounded" })
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

  --Tree-explorer-nvim
  use("kyazdani42/nvim-tree.lua")

  --LSP
  use({ "williamboman/mason.nvim" })
  use("williamboman/mason-lspconfig.nvim")
  use("neovim/nvim-lspconfig")
  use('onsails/lspkind-nvim')

  --LSP-Saga
  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    opt = true,
    event = "LspAttach",
    config = function()
      require('diego.lspsaga')
    end,
    requires = {
      { "nvim-tree/nvim-web-devicons" },
      --Please make sure you install markdown and markdown_inline parser
      { "nvim-treesitter/nvim-treesitter" }
    }
  })
  --Nice References
  use({
    'wiliamks/nice-reference.nvim',
    requires = {
      { 'rmagatti/goto-preview', config = function() require('goto-preview').setup {} end } --optional
    }
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
  -- use('SirVer/ultisnips')

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
  use({ 'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim' })

  --Flutter snippets
  use('Nash0x7E2/awesome-flutter-snippets')

  -- Packer Sync
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
