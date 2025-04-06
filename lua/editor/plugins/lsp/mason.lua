return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    -- LSP Servers
    local servers = require('editor.config.servers')

    -- Setting Mappings
    local keymap = vim.api.nvim_set_keymap

    -- keymap('n', "gr", "<cmd>Telescope lsp_references<cr>", { noremap = true, silent = true })
    keymap('n', "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", { noremap = true, silent = true })


    -- Mason and LSP Setup
    local mason = require('mason')
    local mlsp = require('mason-lspconfig')

    vim.diagnostic.config({
      virtual_text = {
        prefix = "", -- Could be '●', '▎', 'x'
        spacing = 4,
      },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = '',
          [vim.diagnostic.severity.WARN] = '',
          [vim.diagnostic.severity.INFO] = '',
          [vim.diagnostic.severity.HINT] = '',
        }
      },
      underline = true,
      update_in_insert = false,
      severity_sort = false,

    })
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      }
    })
    mlsp.setup({
      ensure_installed = servers,
      automatic_installation = true,
    })
  end
}
