local status_ok, null_ls = pcall(require, "null-ls")

if not status_ok then
  return
end

local formatting = null_ls.builtins.formatting

local sources = {
  formatting.prettier,
  formatting.autopep8,
}

-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local on_attach = function(client, bufnr)
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
        -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
        vim.lsp.buf.format({
          async = true,
          bufnr = bufnr,
          timeout_ms = 2000,
          filter = function(_)
            return client.name == "null-ls"
          end
        })
      end,
    })
  end
end

null_ls.setup({
  sources = sources,
  on_attach = on_attach,
})
