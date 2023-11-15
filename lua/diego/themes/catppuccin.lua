local status_ok, catppuccin = pcall(require, 'catppuccin')

if not status_ok then
  return
end

catppuccin.setup({
  no_italic = true,     -- Force no italic
  styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
    loops = {},
    functions = {},
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
  },
})
