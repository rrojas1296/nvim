return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",   -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  branch = "v3.x",
  config = function()
    local neotree = require 'neo-tree'

    neotree.setup({
      window = {
        mappings = {
          ["l"] = "open",
        }
      },
      filesystem = {
        window = {
          mappings = {
            ["I"] = "toggle_hidden"
          }
        }
      }
    })
  end
}
