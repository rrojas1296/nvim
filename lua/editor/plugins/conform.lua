return {
  "stevearc/conform.nvim",
  config = function()
    local status_ok, conform = pcall(require, "conform")

    if not status_ok then
      return
    end

    conform.setup(
      {
        formatters_by_ft = {
          javascript = { "prettier", "prettier", stop_after_first = true },
          typescript = { "prettier", "prettier", stop_after_first = true },
          typescriptreact = { "prettier", "prettier", stop_after_first = true },
          javascriptreact = { "prettier", "prettier", stop_after_first = true },
          html = { "prettier", "prettier", stop_after_first = true },
          json = { "prettier", "prettier", stop_after_first = true },
          css = { "prettier", "prettier", stop_after_first = true },
          scss = { "prettier", "prettier", stop_after_first = true },
          markdown = { "prettier", "prettier", stop_after_first = true },
          lua = { "stylua", stop_after_first = true },
          python = { "autopep8", stop_after_first = true },
          graphql = { "prettier", "prettier", stop_after_first = true },
          astro = { "prettier", "prettier", stop_after_first = true },
        }
      }
    )
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*",
      callback = function(args)
        conform.format({ bufnr = args.buf })
      end,
    })
    vim.keymap.set({ "n", "v" }, "<leader>lf", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout = 1000,
      })
    end)
  end
}
