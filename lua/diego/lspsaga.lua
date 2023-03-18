local lspsaga = require('lspsaga')

lspsaga.setup()

local keymap = vim.keymap.set

local opts = { noremap = true, silent = true }

keymap("n", "gr", ":Lspsaga lsp_finder<CR>", opts)
keymap('n', 'gd', "<cmd>Lspsaga goto_definition<CR>", opts)
keymap('n', 'K', "<cmd>Lspsaga hover_doc<CR>", opts)
