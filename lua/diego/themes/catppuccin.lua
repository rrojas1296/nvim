local status_ok, catppuccin = pcall(require, 'catppuccin')

if not status_ok then
  return
end

catppuccin.setup({
  no_italic = true,     -- Force no italic
})

local colorscheme = vim.cmd.colorscheme
colorscheme "catppuccin"
