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
  "  ██████╗ ██████╗  ██████╗      ██╗ █████╗ ███████╗  ",
  " ██╔══██╗██╔══██╗██╔═══██╗     ██║██╔══██╗██╔════╝ ",
  "  ██║  ██║██████╔╝██║   ██║     ██║███████║███████╗  ",
  "  ██║  ██║██╔══██╗██║   ██║██   ██║██╔══██║╚════██║  ",
  " ██████╔╝██║  ██║╚██████╔╝╚█████╔╝██║  ██║███████║ ",
  "  ╚═════╝ ╚═╝  ╚═╝ ╚═════╝  ╚════╝ ╚═╝  ╚═╝╚══════╝  ",
  "                                                            ",
  "                                                            ",
  "                                                            ",
  "                                                            "
}

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
    center = buttons,
    header = logo
  },
  hide = {
    statuslinne = true,
    tabline = true,
    winbar = true
  }
})

if vim.o.filetype == "lazy" then
  vim.cmd.close()
  vim.api.nvim_create_autocmd("User", {
    pattern = "DashboardLoaded",
    callback = function()
      require("lazy").show()
    end,
  })
end
