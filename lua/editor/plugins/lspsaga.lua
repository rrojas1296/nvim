return {
  "nvimdev/lspsaga.nvim",
  config = function()
    local saga = require('lspsaga')

    saga.setup({
      diagnostic = {
        max_height = 0.8,
        keys = {
          quit = { 'q', '<ESC>' }
        }
      },
    })
  end
}
