return {
  "stevearc/conform.nvim",
  config = function()
    local ok, conform = pcall(require, "conform")
    if not ok then
      return
    end

    conform.setup({
      -- Global format-on-save config
      format_on_save = {
        timeout_ms = 8000,
        lsp_fallback = true,
      },

      formatters_by_ft = {
        javascript = { "prettier", stop_after_first = true },
        typescript = { "prettier", stop_after_first = true },
        typescriptreact = { "prettier", stop_after_first = true },
        javascriptreact = { "prettier", stop_after_first = true },
        html = { "prettier", stop_after_first = true },
        json = { "prettier", stop_after_first = true },
        css = { "prettier", stop_after_first = true },
        scss = { "prettier", stop_after_first = true },
        markdown = { "prettier", stop_after_first = true },
        graphql = { "prettier", stop_after_first = true },
        astro = { "prettier", stop_after_first = true },

        lua = { "stylua", stop_after_first = true },
        python = { "black", stop_after_first = true },
        dart = { "dart_format", stop_after_first = true },

        -- ✅ Prisma: use CLI formatter (FAST)
        prisma = { "prisma" },
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>lf", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 8000,
      })
    end, { desc = "Format Document" })
  end,
}
