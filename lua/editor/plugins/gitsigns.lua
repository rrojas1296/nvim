return {
  "lewis6991/gitsigns.nvim",
  config = true,
  opts = {
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns
      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
      end

      map("n", "<leader>hb", function()
        gs.blame_line({ full = true })
      end, "Blame line")

    end,
  }
}
