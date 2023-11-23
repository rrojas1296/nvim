return {
  "akinsho/bufferline.nvim",
  config = function()
    local bufferline = require "bufferline"

    bufferline.setup({
      options = {
        hover = {
          enabled = true
        },
        separator_style = "thick"
      }
    })
  end
}
