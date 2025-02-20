return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    local theme = require('tokyonight')
    local colorscheme = vim.cmd.colorscheme
    theme.setup()
    colorscheme "tokyonight-night"
  end
}
