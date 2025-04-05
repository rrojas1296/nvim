return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  config = function()
    local noice = require("noice")
    local notify = require('notify')

    notify.setup({
      background_colour = '#000000',
      max_width = 48,
      stages = "slide",
      merge_duplicates = true,
    })

    noice.setup({
      lsp = {
        hover = {
          enabled = false,
        }
      }
    })
  end
}
