return {
  "folke/tokyonight.nvim",
  lazy = false,
  config = function()
    local colorscheme = vim.cmd.colorscheme
    local tokyonight = require('tokyonight')

    tokyonight.setup()
    colorscheme "tokyonight-night"
  end

}
