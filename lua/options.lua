vim.o.number = true
-- vim.o.relativenumber = true

vim.o.signcolumn = 'yes'

vim.o.tabstop = 4
vim.o.shiftwidth = 4

vim.o.updatetime = 300

vim.o.termguicolors = true

vim.o.mouse = 'a'
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.grep_string, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.api.nvim_set_keymap(
	'n',
	'<C-p>',
	":lua require'telescope'.extensions.project.project{}<CR>",
	{ noremap = true, silent = true }
)
vim.keymap.set('n', '<leader>gb', builtin.git_branches, {})
-- split panel
vim.keymap.set('n', '<leader><leader>s', ':sp<CR>')
vim.keymap.set('n', '<leader><leader>v', ':vsp<CR>')

local treeview = require('nvim-tree.api')
vim.keymap.set('n', 'tt', treeview.tree.toggle)
vim.keymap.set('n', 'tc', treeview.tree.collapse_all)
vim.keymap.set('n', 'te', treeview.tree.expand_all)

--  quit from insert mode
vim.keymap.set('i', 'jk', '<Esc>`^', { noremap = true })

-- enlarge/shrink horizontal panel
vim.keymap.set('n', '<leader>eh', ":res +3 <CR>")
vim.keymap.set('n', '<leader>sh', ":res -3 <CR>")

-- enlarge/shrink verticall panel
vim.keymap.set('n', '<leader>ev', ":vertical res +3 <CR>")
vim.keymap.set('n', '<leader>sv', ":vertical res -3 <CR>")

-- quit :q
vim.keymap.set('n', '<leader>q', ":q<CR>")


-- lsp
vim.keymap.set('n', 'gd', ":lua vim.lsp.buf.definition()<CR>zz", { silent = true })

vim.keymap.set('n', '<leader>;;;', '<C-w-t>')

-- move line
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', { noremap = true })

