require('mason').setup()
require('mason-lspconfig').setup {
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
    "luau_lsp",
    "docker_compose_language_service",
    "dockerls"
  },
  automatic_installation = true,
}
