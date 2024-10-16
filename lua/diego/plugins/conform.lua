return {
  "stevearc/conform.nvim",
  config = function()
    local status_ok, conform = pcall(require, "conform")

    if not status_ok then
      return
    end

    conform.setup()
  end
}
