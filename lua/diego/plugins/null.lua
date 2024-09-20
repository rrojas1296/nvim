return {
  "jose-elias-alvarez/null-ls.nvim",
  config = function()
    local status_ok, null_ls = pcall(require, "null-ls")

    if not status_ok then
      return
    end

    local formatting = null_ls.builtins.formatting

    local sources = {
      formatting.prettier,
      formatting.autopep8,
    }

    null_ls.setup({
      sources = sources,
    })
  end
}
