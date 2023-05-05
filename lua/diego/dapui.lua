local status_ok, dapui = pcall(require, 'dapui')

if not status_ok then
  return
end
dapui.setup({
  icons = { expanded = "▾", collapsed = "▸" },
  layouts = {
    {
      elements = {
        "repl",
        "console"
      },
      size = 10,
      position = "bottom",
    },
  },
})
