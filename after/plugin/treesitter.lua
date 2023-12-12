require('nvim-treesitter.install').compilers = { "clang" }
require('nvim-treesitter.configs').setup{
	esnure_installed = {'vim', 'vimdoc','lua','cpp', 'query', 'javascript',  },
	auto_install = true,
	highlight = {enable = true},
	indent = {enable = true}
}
