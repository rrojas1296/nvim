return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "williamboman/mason.nvim",
  },
  config = function()
    local mason = require('mason')
    local mason_config = require('mason-lspconfig')
    local servers = require('diego.plugins.cmp.servers')
    mason.setup()
    mason_config.setup {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      },
      ensure_installed = {
        'tsserver',
        'tailwindcss',
        'pyright',
        'eslint',
        'graphql',
        'lua_ls',
        'cssls',
        "emmet_ls",
        "html",
        "lua_ls",
        "vimls",
        "docker_compose_language_service",
        "dockerls",
        "astro"
      },
      automatic_installation = true,
    }
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    -- local capabilities = require('cmp_nvim_lsp').default_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
    for _, server in pairs(servers) do
      require('lspconfig')[server].setup {
        capabilities = capabilities,
      }
    end
  end
}
