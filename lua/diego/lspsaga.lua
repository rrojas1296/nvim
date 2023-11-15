local status_ok, lspsaga = pcall(require, 'lspsaga')
if not status_ok then
  return
end
local keymap = vim.keymap.set

local opts = { noremap = true, silent = true }

keymap("n", "gr", "<cmd>Lspsaga finder ref<CR>", opts)
keymap('n', 'gd', "<cmd>Lspsaga goto_definition<CR>", opts)
keymap('n', 'K', "<cmd>Lspsaga hover_doc<CR>", opts)

lspsaga.setup({
  finder = {
    max_height = 0.6,
    force_max_height = false,
    keys = {
      toggle_or_open = '<CR>',
      quit = '<ESC>',
    },
  },
})
