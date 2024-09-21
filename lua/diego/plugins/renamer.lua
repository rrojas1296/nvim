return {
  'filipdutescu/renamer.nvim',
  branch = 'master',
  requires = { { 'nvim-lua/plenary.nvim' } },
  config = function()
    local renamer = require('renamer')
    renamer.setup({
      min_width = 25,
      title = 'New Name'
    })
    local map = vim.api.nvim_set_keymap
    map('n', '<leader>rn', '<cmd>lua require("renamer").rename()<cr>',
      { noremap = true, silent = true })
    map('v', '<leader>rn', '<cmd>lua require("renamer").rename()<cr>',
      { noremap = true, silent = true })
  end
}
