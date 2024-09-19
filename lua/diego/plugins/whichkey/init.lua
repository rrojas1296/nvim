return {
  "folke/which-key.nvim",
  event = 'VeryLazy',
  config = function()
    local status_ok,wk = pcall(require, 'which-key')
    if not status_ok then
      return
                   end
    local mappings = require('diego.plugins.whichkey.mappings')
    local setup = require('diego.plugins.whichkey.setup')
    wk.setup(setup)
    wk.add(mappings)
  end
}
