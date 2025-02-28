return {
  "olimorris/onedarkpro.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    local theme = require('onedarkpro')
    local colorscheme = vim.cmd.colorscheme
    theme.setup()
    colorscheme "onedark"
  end
}
