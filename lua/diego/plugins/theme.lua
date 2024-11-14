return {
  'Mofiqul/vscode.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    local theme = require('vscode')
    local colorscheme = vim.cmd.colorscheme
    theme.setup()
    colorscheme "vscode"
  end
}
