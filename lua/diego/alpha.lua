local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end
local dashboard = require("alpha.themes.dashboard")

dashboard.section.buttons.val = {
  dashboard.button("f", "  Find file", ":Telescope find_files hidden=true theme=dropdown<CR>"),
  dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("r", "  Recently used files", ":Telescope oldfiles hidden=true<CR>"),
  dashboard.button("t", "󰮗  Find text", ":Telescope live_grep hidden=true<CR>"),
  dashboard.button("q", "󰗼  Quit Neovim", ":qa<CR>"),
}

local logo = [[
  ██████╗ ██████╗  ██████╗      ██╗ █████╗ ███████╗
  ██╔══██╗██╔══██╗██╔═══██╗     ██║██╔══██╗██╔════╝
  ██║  ██║██████╔╝██║   ██║     ██║███████║███████╗
  ██║  ██║██╔══██╗██║   ██║██   ██║██╔══██║╚════██║
  ██████╔╝██║  ██║╚██████╔╝╚█████╔╝██║  ██║███████║
  ╚═════╝ ╚═╝  ╚═╝ ╚═════╝  ╚════╝ ╚═╝  ╚═╝╚══════╝
  ]]

logo = string.rep("\n", 20) .. logo .. string.rep('\n', 200)

dashboard.section.header.val = logo
dashboard.section.header.type = "text"
dashboard.config.opts.margin = 30


dashboard.section.footer.val = "https://drojascam.com"

alpha.setup(dashboard.config)
