-- CATPPUCCIN THEME

-- return {
--   "catppuccin/nvim",
--   config = function()
--     local status_ok, catppuccin = pcall(require, 'catppuccin')
--
--     if not status_ok then
--       return
--     end
--
--     catppuccin.setup({
--       flavour = "mocha",     -- latte, frappe, macchiato, mocha
--     })
--     local colorscheme = vim.cmd.colorscheme
--     colorscheme "catppuccin"
--   end
-- }

-- TOKYO NIGHT THEME

return {
  "folke/tokyonight.nvim",
  config = function()
    local status_ok, tokyonight = pcall(require, 'tokyonight')

    if not status_ok then
      return
    end

    tokyonight.setup({
      style = "night",
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
        functions = { italic = false }
      }
    })
    local colorscheme = vim.cmd.colorscheme
    colorscheme "tokyonight"
  end
}


-- VSCODE THEME
--
-- return {
--   "Mofiqul/vscode.nvim",
--   config = function()
--     local status_ok, vscode = pcall(require, 'vscode')
--
--     if not status_ok then
--       return
--     end
--     vscode.setup()
--     local colorscheme = vim.cmd.colorscheme
--     colorscheme "vscode"
--   end
-- }

-- MELLOW THEME

-- return {
--   "mellow-theme/mellow.nvim",
--   config = function ()
--     local status_ok, mellow = pcall(require, 'mellow')
--
--     if not status_ok then
--       return
--     end
--
--     local colorscheme = vim.cmd.colorscheme
--     colorscheme "mellow"
--   end
-- }

-- NORDIC THEME

-- return {
--   "AlexvZyl/nordic.nvim",
--   config = function ()
--
--     local status_ok, nordic = pcall(require, 'nordic')
--
--     if not status_ok then
--       return
--     end
--
--     nordic.setup()
--
--     local colorscheme = vim.cmd.colorscheme
--     colorscheme "nordic"
--   end
-- }
