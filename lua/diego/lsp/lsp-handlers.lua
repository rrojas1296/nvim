-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
-- local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local servers = {
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
  "luau_lsp"
}

for _, server in pairs(servers) do
  -- server = vim.split(server, "@")[1]
  require('lspconfig')[server].setup {
    on_attach = on_attach,
    capabilities = capabilities
  }
end
