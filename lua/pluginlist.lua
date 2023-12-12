return {
	{
		"m4xshen/autoclose.nvim",
	},
	-- nvim tree
	{
		"nvim-tree/nvim-tree.lua",
		"nvim-tree/nvim-web-devicons",
	},
	-- comment
	{ 'numToStr/Comment.nvim',     opts = {} },

	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end
	},
	-- theme
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		lazy = false
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000
	},

	-- lsp
	{ 'VonHeikemen/lsp-zero.nvim', branch = 'v3.x' },
	{ 'neovim/nvim-lspconfig' },
	{ 'hrsh7th/cmp-nvim-lsp' },
	{ 'hrsh7th/nvim-cmp' },
	{ 'L3MON4D3/LuaSnip' },
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	'mfussenegger/nvim-lint',

	'folke/neodev.nvim', -- new

	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip',
			'rafamadriz/friendly-snippets',
			'hrsh7th/cmp-nvim-lsp',
		},
	},


	--telescope
	{
		'nvim-telescope/telescope.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},

	{
		'nvim-telescope/telescope-fzf-native.nvim',
		build =
		'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
	},


	"nvim-telescope/telescope-project.nvim",
	-- tree view
	{
		'nvim-lualine/lualine.nvim',
		dependencies = {
			"nvim-tree/nvim-web-devicons"
		},
		config = function()
			require("lualine").setup({
				icons_enabled = true,
				theme = 'onedark',
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		event = 'BufRead',
		build = ":TSUpdate",
	},

	{
		"stevearc/conform.nvim",
		event = { "BufReadpre", "BufNewFile" },
		config = function()
			local conform = require("conform")
			conform.setup({
				formatters_by_ft = {
					javascript = { "prettier" },
					typescript = { "prettier" },
					css = { "prettier" },
					html = { "prettier" },
					json = { "prettier" },
					javascriptreact = { "prettier" },
					typescriptreact = { "prettier" },
					python = { "isort", "black" },
					lua = { "stylua" },
				},
				format_on_save = {
					lsp_fallback = true,
					async = false,
					timeout_ms = 2000,
				}
			})

			vim.keymap.set({ 'n', 'v' }, "<leader>fon", function()
				conform.format({
					lsp_fallback = true,
					async = false,
					timeout_ms = 2000,
				})
			end, { desc = "format file in range (in visual mode)}" })
		end
	},

	-- Rest client
	"diepm/vim-rest-console",

	-- surround bracket
	"tpope/vim-surround",

	-- auto save
	'tmillr/sos.nvim',

	-- fine command
	'VonHeikemen/fine-cmdline.nvim',
	'MunifTanjim/nui.nvim',

	-- harpoon
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
	},

}

