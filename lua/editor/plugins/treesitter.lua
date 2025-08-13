return {
  'nvim-treesitter/nvim-treesitter',
  run = function()
    local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
    ts_update()
  end,
  config = function()
    local treesitter = require "nvim-treesitter.configs"

    treesitter.setup {
      ensure_installed = {
        "bash",
        "c",
        "astro",
        "diff",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "jsonc",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
        "sql",
        "graphql",
        "go",
        "prisma"
      },
      auto_install = true,
      sync_install = false,
      ignore_install = { "phpdoc" },
      modules = {
        "norg",
        "norg_meta",
        "norg_table",
        "norg_todo",
        "norg_context",
      },
      highlight = {
        enable = true,
      },
    }
  end
}
