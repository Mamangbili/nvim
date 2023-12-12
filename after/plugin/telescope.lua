local project_actions = require("telescope._extensions.project.actions")

require('telescope').setup({
	extensions = {
		fzf = {
			fuzzy = true,          -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
		project = {
			base_dirs = {
				"C:/Users/Asus/Appdata/local/nvim",
				{ 'C:/Users/Asus/AppData/Local/nvim', max_depth = 1 },
				{ 'D:/project',                       max_depth = 4 },
				{ 'D:/project',                       max_depth = 2 },
			},
			theme = "dropdown",
			order_by = "asc",
			search_by = "title",
			sync_with_nvim_tree = true,
			on_project_selected = function(prompt_bufnr)
				-- Do anything you want in here. For example:
				project_actions.change_working_directory(prompt_bufnr, false)
				require("nvim-tree.api").tree.change_root(vim.fn.getcwd())
			end
		}
	},
	defaults = {
		file_ignore_patterns = {
			"node_modules"
		}
	},
})

require('telescope').load_extension('fzf')

require('telescope').setup({
	extensions = {
		fzf = {
			fuzzy = true,          -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
		project = {
			base_dirs = {
				{ "C:/Users/Asus/Appdata/local/nvim", max_depth = 4 },
				{ 'D:/project',                       max_depth = 4 },
				{ 'D:/project',                       max_depth = 2 },
			},
			theme = "dropdown",
			order_by = "asc",
			search_by = "title",
			sync_with_nvim_tree = true,
			on_project_selected = function(prompt_bufnr)
				-- Do anything you want in here. For example:
				project_actions.change_working_directory(prompt_bufnr, false)
				require("nvim-tree.api").tree.change_root(vim.fn.getcwd())
			end
		}
	},
	defaults = {
		file_ignore_patterns = {
			"node_modules"
		}
	},
})

require('telescope').load_extension('fzf')

