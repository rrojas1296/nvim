return {
  "nvimdev/lspsaga.nvim",
  config = function()
    local saga = require('lspsaga')

    -- Setting keymap
    vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<cr>', { desc = 'Hover Doc' })
    vim.keymap.set('n', 'gr', '<cmd>Lspsaga finder<cr>', { desc = 'Find References' })
    vim.keymap.set('n', 'gd', '<cmd>Lspsaga goto_definition<cr>', { desc = 'Go to definition' })

    saga.setup({
      diagnostic = {
        max_height = 0.8,
        keys = {
          quit = { 'q', '<ESC>' }
        }
      },
      finder = {
        keys= {
          toggle_or_open = '<CR>'
        }
      }
    })
  end
}
