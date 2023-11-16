local status_ok, dashboard = pcall(require, "dashboard")
if not status_ok then
  return
end

local logo = {
  "                                                            ",
  "                                                            ",
  "                                                            ",
  "                                                            ",
  "                                                            ",
  "                                                            ",
  "                                                            ",
  "                                                            ",
  "                                                            ",
  "                                                            ",
  "                                                            ",
  "                                                            ",
  "                                                            ",
  "                                                            ",
  "                                                            ",
  "  ██████╗ ██████╗  ██████╗      ██╗ █████╗ ███████╗  ",
  "  ██╔══██╗██╔══██╗██╔═══██╗     ██║██╔══██╗██╔════╝ ",
  "  ██║  ██║██████╔╝██║   ██║     ██║███████║███████╗  ",
  "  ██║  ██║██╔══██╗██║   ██║██   ██║██╔══██║╚════██║  ",
  "  ██████╔╝██║  ██║╚██████╔╝╚█████╔╝██║  ██║███████║ ",
  "  ╚═════╝ ╚═╝  ╚═╝ ╚═════╝  ╚════╝ ╚═╝  ╚═╝╚══════╝  ",
  "                                                            ",
  "                                                            ",
  "                                                            ",
  "                                                            "
}


dashboard.setup({
  theme = "doom",
  change_to_vcs_root = true,
  disable_move = true,
  config = {
    footer = function()
      local stats = require("lazy").stats()
      local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
      return { "", "", "", "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
    end,
    center = {
      { action = "Telescope find_files", desc = " Find file", icon = " ", key = "f" },
      { action = "ene | startinsert", desc = " New file", icon = " ", key = "n" },
      { action = "Telescope oldfiles", desc = " Recent files", icon = " ", key = "r" },
      { action = "Telescope live_grep", desc = " Find text", icon = " ", key = "g" },
      { action = "LazyExtras", desc = " Lazy Extras", icon = " ", key = "x" },
      { action = "Lazy", desc = " Lazy", icon = "󰒲 ", key = "l" },
      { action = "qa!", desc = " Quit", icon = " ", key = "q" },
    },
    header = logo
  },
  hide = {
    statuslinne = true,
    tabline = true,
    winbar = true
  }
})
