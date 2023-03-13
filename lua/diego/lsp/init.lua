local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end
require('diego.lsp.lsp-handlers')
require('diego.lsp.null-ls')
