local status_ok, telescope = pcall(require, 'telescope')

if not status_ok then
  return
end

telescope.setup {
  defaults = {
    file_ignore_patterns = { "node_modules", ".git", ".next","build" },
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
      previewer = false ,
      theme = "dropdown",
      hidden = true 
    },
    oldfiles = {
      previewer = false ,
      theme = "dropdown",
      hidden = true 
    },
    live_grep = {
      additional_args = function(opts)
      hidden = true 
        return { "--hidden" }
      end
    },
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}
