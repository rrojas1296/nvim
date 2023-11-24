return {
  "nvim-telescope/telescope.nvim",
  dependencies = { 'nvim-lua/plenary.nvim', "nvim-telescope/telescope-file-browser.nvim" },
  config = function()
    require('telescope').setup({
      extensions = {
        file_browser = {
          theme = "dropdown",
          -- disables netrw and use telescope-file-browser in its place
          hijack_netrw = true,
          mappings = {
            ["i"] = {
              -- your custom insert mode mappings
            },
            ["n"] = {
              -- your custom normal mode mappings
            },
          },
        },
      },
      defaults = {
        file_ignore_patterns = { "node_modules", ".git", ".next", "build" },
        prompt_prefix = ' ',
        selection_caret = '  ',
        mappings = {
          i = {
            ["<C-h>"] = "which_key"
          }
        }
      },
      pickers = {
        find_files = {
          previewer = false,
          theme = "dropdown",
          hidden = false
        },
        oldfiles = {
          previewer = false,
          theme = "dropdown",
          hidden = true
        },
        live_grep = {
          additional_args = function()
            return { "--hidden" }
          end
        },
      },
    })
  end
}
