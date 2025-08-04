return {
  'marko-cerovac/material.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    local theme = require('material')
    local colorscheme = vim.cmd.colorscheme
    theme.setup()
    vim.g.material_style = "deep ocean"
    colorscheme 'material'
  end
}
