local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end
local dashboard = require("alpha.themes.dashboard")

dashboard.section.buttons.val = {
	dashboard.button("f", "  Find file", ":Telescope find_files no_ignore=true hidden=true theme=dropdown<CR>"),
	dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("r", "  Recently used files", ":Telescope oldfiles no_ignore=true hidden=true<CR>"),
	dashboard.button("t", "  Find text", ":Telescope live_grep no_ignore=true hidden=true<CR>"),
	dashboard.button("q", "  Quit Neovim", ":qa<CR>"),}

local function footer()
	return "drojascam.com"
end

dashboard.section.footer.val = footer()

alpha.setup(dashboard.config)
