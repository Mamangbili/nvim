require("nvim-tree").setup {
	disable_netrw = true,
	hijack_cursor = true,
	update_focused_file = {
		enable = true,
	},
	diagnostics = {
		enable = true,
		show_on_dirs = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},

	view = {
		width = 28,
		side = 'left',
		signcolumn = 'yes',
	},

	log = {
		enable = true,
		truncate = true,
		types = {
			diagnostics = true,
		},
	},
}
require 'nvim-web-devicons'.setup()

