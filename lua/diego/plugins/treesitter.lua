return {
  'nvim-treesitter/nvim-treesitter',
  run = function()
    local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
    ts_update()
  end,
  config = function()
    local treesitter = require "nvim-treesitter.configs"

    treesitter.setup {
      ensure_installed = 'all',
      highlight = {
        enable = true,
      },
      indent = { enable = true },
    }
  end
}
