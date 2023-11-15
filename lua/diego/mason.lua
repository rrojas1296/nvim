local status_1,mason = pcall(require,'mason')
local status_2,mason_config = pcall(require,'mason-lspconfig')

if not status_1 then
  return
end

if not status_2 then
  return
end
mason.setup()
mason_config.setup {
  ensure_installed = {
    'tsserver',
    'tailwindcss',
    'pyright',
    'eslint',
    'graphql',
    'lua_ls',
    'cssls',
    "emmet_ls",
    "html",
    "lua_ls",
    "vimls",
    "luau_lsp",
    "docker_compose_language_service",
    "dockerls"
  },
  automatic_installation = true,
}
