return {
  "Exafunction/windsurf.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
  },
  config = function()
    local status_ok, codeium = pcall(require, "codeium")
    if not status_ok then
      return
    end

    codeium.setup({
      virtual_text = {
        enabled = true
      }
    })
  end
}
