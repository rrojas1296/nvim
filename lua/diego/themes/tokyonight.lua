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

