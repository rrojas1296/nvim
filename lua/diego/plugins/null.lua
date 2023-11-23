return {
  "jose-elias-alvarez/null-ls.nvim",
  config = function()
    local status_ok, null_ls = pcall(require, "null-ls")

    if not status_ok then
      return
    end

    local formatting = null_ls.builtins.formatting
    local code_actions = null_ls.builtins.code_actions
    local diagnostics = null_ls.builtins.diagnostics

    local sources = {
      formatting.prettier,
      formatting.autopep8,
    }

    -- if you want to set up formatting on save, you can use this as a callback
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    local on_attach = function(client, bufnr)
      if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      end
    end

    null_ls.setup({
      sources = sources,
      on_attach = on_attach,
    })
  end
}
