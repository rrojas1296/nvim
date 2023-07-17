local lspsaga = require('lspsaga')

lspsaga.setup({
  finder = {
    max_height = 0.5,
    min_width = 30,
    force_max_height = false,
    keys = {
      shuttle = 'p',
      toggle_or_open = '<CR>',
      vsplit = 's',
      split = 'i',
      tabe = 't',
      tabnew = 'r',
      quit = '<ESC>',
    },
  },
})

local keymap = vim.keymap.set

local opts = { noremap = true, silent = true }

keymap("n", "gr", ":Lspsaga finder ref<CR>", opts)
keymap('n', 'gd', "<cmd>Lspsaga goto_definition<CR>", opts)
keymap('n', 'K', "<cmd>Lspsaga hover_doc<CR>", opts)
keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")

-- Diagnostic jump with filters such as only jumping to an error
keymap("n", "[E", function()
  require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
end)
keymap("n", "]E", function()
  require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
end)
