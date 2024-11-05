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
          javascript = { "prettierd", "prettier", stop_after_first = true },
          typescript = { "prettierd", "prettier", stop_after_first = true },
          typescriptreact = { "prettierd", "prettier", stop_after_first = true },
          javascriptreact = { "prettierd", "prettier", stop_after_first = true },
          html = { "prettierd", "prettier", stop_after_first = true },
          json = { "prettierd", "prettier", stop_after_first = true },
          css = { "prettierd", "prettier", stop_after_first = true },
          scss = { "prettierd", "prettier", stop_after_first = true },
          markdown = { "prettierd", "prettier", stop_after_first = true },
          lua = { "stylua", stop_after_first = true },
          python = { "autopep8", stop_after_first = true },
          graphql = { "prettierd", "prettier", stop_after_first = true },
        }
      }
    )
    vim.keymap.set({ "n", "v" }, "<leader>lf", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout = 1000,
      })
    end)
  end
}
