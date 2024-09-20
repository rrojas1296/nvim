return {
  "folke/tokyonight.nvim",
  lazy = false,
  config = function()
    local tokyonight = require('tokyonight')

    tokyonight.setup()

    local colorscheme = vim.cmd.colorscheme
    colorscheme "tokyonight-night"
  end
}
