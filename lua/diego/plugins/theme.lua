-- CATPPUCCIN THEME

return {
  "catppuccin/nvim",
  config = function()
    local status_ok, catppuccin = pcall(require, 'tokyonight')

    if not status_ok then
      return
    end

    catppuccin.setup({
      flavour = "auto",     -- latte, frappe, macchiato, mocha
    })
    local colorscheme = vim.cmd.colorscheme
    colorscheme "catppuccin"
  end
}

-- TOKYO NIGHT THEME

-- return {
--   "folke/tokyonight.nvim",
--   config = function()
--     local status_ok, tokyonight = pcall(require, 'tokyonight')
--
--     if not status_ok then
--       return
--     end
--
--     tokyonight.setup({
--       style = "night",
--       styles = {
--         comments = { italic = false },
--         keywords = { italic = false },
--         functions = { italic = false }
--       }
--     })
--     local colorscheme = vim.cmd.colorscheme
--     colorscheme "tokyonight"
--   end
-- }

