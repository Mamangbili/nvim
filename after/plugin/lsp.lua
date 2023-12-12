local lsp_zero = require("lsp-zero")

lsp_zero.preset("recommended")
lsp_zero.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp_zero.default_keymaps({ buffer = bufnr })
end)


require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {},
	handlers = {
		lsp_zero.default_setup,
	},
})

require('lspconfig').tsserver.setup({
	init_options = {
		preferences = {
			disableSuggestions = true,
		},
	},
})


vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})


-- local on_attach = function(_, bufnr)
-- 	local bufmap = function(keys, func)
-- 		vim.keymap.set('n', keys, func, { buffer = bufnr })
-- 	end
--
-- 	bufmap('<leader>r', vim.lsp.buf.rename)
-- 	bufmap('<leader>a', vim.lsp.buf.code_action)
--
-- 	bufmap('gd', vim.lsp.buf.definition)
-- 	bufmap('gD', vim.lsp.buf.declaration)
-- 	bufmap('gI', vim.lsp.buf.implementation)
-- 	bufmap('<leader>D', vim.lsp.buf.type_definition)
--
-- 	bufmap('gr', require('telescope.builtin').lsp_references)
-- 	bufmap('<leader>f', require('telescope.builtin').find_files)
-- 	bufmap('<leader>F', require('telescope.builtin').lsp_dynamic_workspace_symbols)
--
-- 	bufmap('K', vim.lsp.buf.hover)
--
--
-- 	vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
-- 		vim.lsp.buf.format()
-- 	end, {})
-- end

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- mason
-- require("mason").setup()
-- require("mason-lspconfig").setup_handlers({
--
-- 	function(server_name)
-- 		require("lspconfig")[server_name].setup {
-- 			on_attach = on_attach,
-- 			capabilities = capabilities
-- 		}
-- 	end,
--
-- 	["lua_ls"] = function()
-- 		require('neodev').setup()
-- 		require('lspconfig').lua_ls.setup {
-- 			on_attach = on_attach,
-- 			capabilities = capabilities,
-- 			settings = {
-- 				Lua = {
-- 					workspace = { checkThirdParty = false },
-- 					telemetry = { enable = false },
-- 				},
-- 			}
-- 		}
-- 	end

-- another example
-- ["omnisharp"] = function()
--     require('lspconfig').omnisharp.setup {
--         filetypes = { "cs", "vb" },
--         root_dir = require('lspconfig').util.root_pattern("*.csproj", "*.sln"),
--         on_attach = on_attach,
--         capabilities = capabilities,
--         enable_roslyn_analyzers = true,
--         analyze_open_documents_only = true,
--         enable_import_completion = true,
--     }
-- end,
-- })

