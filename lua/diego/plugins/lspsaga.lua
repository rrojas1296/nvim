return {
  'nvimdev/lspsaga.nvim',
  after = 'nvim-lspconfig',
  config = function()
    local lspsaga = require 'lspsaga'
    local keymap = vim.keymap.set

    local opts = { noremap = true, silent = true }

    keymap("n", "gr", "<cmd>Lspsaga finder ref<CR>", opts)
    keymap('n', 'gd', "<cmd>Lspsaga goto_definition<CR>", opts)
    keymap('n', 'K', "<cmd>Lspsaga hover_doc<CR>", opts)

    lspsaga.setup({
      layout = 'float',
      finder = {
        max_height = 0.6,
        force_max_height = false,
        keys = {
          toggle_or_open = '<cr>',
          quit = '<esc>',
        },
      },
    })
  end
}
