return {
  "nvim-tree/nvim-tree.lua",
  config = function()
    local nvimtree = require('nvim-tree')

    local function on_attach(bufnr)
      local api = require("nvim-tree.api")
      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      -- default mappings
      api.config.mappings.default_on_attach(bufnr)


      -- custom mappings
      vim.keymap.set('n', 'l', api.node.open.edit, opts('open file'))
    end
    nvimtree.setup({
      view = {
        width = 35,
        relativenumber = true,
      },
      renderer = {
        indent_markers = {
          enable = true
        },
        icons = {
          glyphs = {
            folder = {
              arrow_closed = "󰁕", -- arrow when folder is closed
              arrow_open = "󰁆", -- arrow when folder is open
            },
          },
        },
      },
      on_attach = on_attach,
    })
  end
}
