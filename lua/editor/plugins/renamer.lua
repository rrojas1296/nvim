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
  end
}
