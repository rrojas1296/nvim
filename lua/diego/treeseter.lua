local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup {
  ensure_installed = 'all',
  highlight = {
    enable = true,
  },
  indent = { enable = true },
}
