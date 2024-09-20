return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "hrsh7th/nvim-cmp"
  },
  config = function()
    local mason = require('mason')
    local masonlspconfig = require('mason-lspconfig')
    local lspconfig = require('lspconfig')
    local servers = require('diego.config.servers')
    local cmp_nvim_lsp = require('cmp_nvim_lsp')
    mason.setup({
      ui = {
        icons = {
          package_installed = "",
          package_uninstalled = "",
          package_pending = "",
        }
      }
    })
    masonlspconfig.setup({
      ensure_installed = servers
    })
    local capabilities = cmp_nvim_lsp.default_capabilities()

    for _, server_name in pairs(servers) do
      lspconfig[server_name].setup({
        capabilities = capabilities,
      })
    end
  end
}
