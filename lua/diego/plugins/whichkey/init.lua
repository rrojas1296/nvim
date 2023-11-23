return {
  "folke/which-key.nvim",
  config = function()
    local mappings = require('diego.plugins.whichkey.mappings')
    local setup = require('diego.plugins.whichkey.setup')

    local opts = {
      mode = "n", -- NORMAL mode
      prefix = "<leader>",
      buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    }
    require('which-key').setup(setup)
    require('which-key').register(mappings, opts)
  end
}
