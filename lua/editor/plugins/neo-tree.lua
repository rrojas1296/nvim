return {
  "nvim-neo-tree/neo-tree.nvim",
  config = function()
    local neo_tree = require("neo-tree")

    neo_tree.setup({
      window = {
        mappings = {
          ["l"] = "open",
          ["I"] = "toggle_hidden",
        }
      }
    })
  end,
}
