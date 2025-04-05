local logos = require('editor.plugins.dashboard.logos')
local buttons = {

  { action = "Telescope find_files", desc = " Find file", icon = " ", key = "f" },
  { action = "ene | startinsert", desc = " New file", icon = " ", key = "n" },
  { action = "Telescope oldfiles", desc = " Recent files", icon = " ", key = "r" },
  { action = "Telescope live_grep", desc = " Find text", icon = "󰈞 ", key = "t" },
  { action = "Lazy", desc = " Lazy", icon = "󰒲 ", key = "l" },
  { action = "qa!", desc = " Quit", icon = " ", key = "q" },
}
for _, button in ipairs(buttons) do
  button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
  button.key_format = "  %s"
end

return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('dashboard').setup {

      theme = "doom",
      change_to_vcs_root = true,
      disable_move = true,
      config = {
        footer = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return { "", "", "", "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
        end,
        center = buttons,
        header = logos.logo1
      },
      hide = {
        statuslinne = true,
        tabline = true,
        winbar = true
      }
    }
  end
}
