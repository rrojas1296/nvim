local status_ok, comment = pcall(require, "Comment")

if not status_ok then
	return
end

comment.setup({
	ensure_installed = "maintained",
	sync_install = false,
	ingore_install = { "" },
	autopairs = {
		enable = true,
	},
	highlight = {
		enable = true,
		disable = { "" },
		additional_vim_regex_highlighting = true,
	},
	indent = { enable = true, disable = { "yaml" } },
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
})
