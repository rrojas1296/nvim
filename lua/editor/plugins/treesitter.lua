return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    local ts = require('nvim-treesitter')
    ts.install {
      "javascript",
      "typescript",
      "tsx",
      "prisma",
      "html",
      "css",
      "json",
      "jsonc",
      "astro",
      "python",
      "sql",
      "dockerfile",
      "yaml",
      "toml",
      "bash",
      "markdown",
      "markdown_inline",
      "regex",
      "vim",
      "vimdoc",
      "query",
    }

    vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
      callback = function(args)
        if vim.bo[args.buf].buftype ~= "" then
          return
        end

        pcall(vim.treesitter.start, args.buf)
      end,
    })
  end
}
