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
      render = "compact",
    })

    noice.setup({
      messages = {
        enabled = false
      },
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
        hover = {
          enabled = false,
        }
      }
    })
  end
}
