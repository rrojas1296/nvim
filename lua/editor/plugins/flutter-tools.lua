return {
  'akinsho/flutter-tools.nvim',
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'stevearc/dressing.nvim', -- optional for vim.ui.select
  },
  config = function()
    local flutter_tools = require('flutter-tools')

    flutter_tools.setup({
      dev_log = {
        open_cmd = 'vsplit'
      },
      settings = {
        enableSnippets = true
      },
      widget_guides = {
        enabled = false,
      },
    })
  end,
}
