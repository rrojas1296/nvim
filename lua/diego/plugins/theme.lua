return {
  "uloco/bluloco.nvim",
  lazy = false,
  priority = 1000,
  dependencies = { 'rktjmp/lush.nvim' },
  config = function()
    local theme = require('bluloco')
    local colorscheme = vim.cmd.colorscheme
    theme.setup()
    colorscheme "bluloco"
  end

}
