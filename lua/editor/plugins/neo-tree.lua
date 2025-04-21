return {
  "nvim-neo-tree/neo-tree.nvim",
  config = function()
    local status_ok, neo_tree = pcall(require, "neo-tree")

    if not status_ok then
      return
    end

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
