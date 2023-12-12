require("sos").setup {

	enabled = true,

	timeout = 3000,

	autowrite = true,

	-- Automatically write all modified buffers before executing a command on
	-- the cmdline. Aborting the cmdline (e.g. via `<Esc>`) also aborts the
	-- write. The point of this is so that you don't have to manually write a
	-- buffer before running commands such as `:luafile`, `:soruce`, or a `:!`
	-- shell command which reads files (such as git or a code formatter).
	-- Autocmds will be executed as a result of the writing (i.e. `nested = true`).
	--
	--     false: don't write changed buffers prior to executing a command
	--
	--     "all": write on any `:` command that gets executed (but not `<Cmd>`
	--            mappings)
	--
	--     "some": write only if certain commands (source/luafile etc.) appear
	--             in the cmdline (not perfect, but may lead to fewer unneeded
	--             file writes; implementation still needs some work, see
	--             lua/sos/impl.lua)
	--
	--     table<string, true>: table that specifies which commands should trigger
	--                          a write
	--                          keys: the full/long names of commands that should
	--                                trigger write
	--                          values: true
	save_on_cmd = "some",

	-- Save/write a changed buffer before leaving it (i.e. on the `BufLeave`
	-- autocmd event). This will lead to fewer buffers having to be written
	-- at once when the global/shared timer fires. Another reason for this is
	-- the fact that neither `'autowrite'` nor `'autowriteall'` cover this case,
	-- so it combines well with those options too.
	save_on_bufleave = true,

	-- Save all buffers when Neovim loses focus. This is provided because
	-- 'autowriteall' does not cover this case. It is particularly useful when
	-- swapfiles have been disabled and you (knowingly or unknowingly) start
	-- editing the same file in another Neovim instance while having unsaved
	-- changes. It helps keep the file/version on the filesystem synchronized
	-- with your latest changes when switching applications so that another
	-- application won't accidentally open old versions of files that you are
	-- still currently editing. Con: it could be that you actually intended to
	-- open an older version of a file in another application/Neovim instance,
	-- although in that case you're probably better off disabling autosaving
	-- altogether (or keep it enabled but utilize a VCS to get the version you
	-- need - that is, if you commit frequently enough). This option also enables
	-- saving on suspend.
	save_on_focuslost = true,

	-- Predicate fn which receives a buf number and should return true if it
	-- should be observed for changes (i.e. whether the buffer should debounce
	-- the shared/global timer). You probably don't want to change this unless
	-- you absolutely need to and know what you're doing. Setting this option
	-- will replace the default fn/behavior which is to observe buffers which
	-- have: a normal 'buftype', 'ma', 'noro'. See lua/sos/impl.lua for the
	-- default behavior/fn.
	---@type fun(bufnr: integer): boolean
	-- should_observe_buf = require("sos.impl").should_observe_buf,

	-- The function that is called when the shared/global timer fires. You
	-- probably don't want to change this unless you absolutely need to and know
	-- what you're doing. Setting this option will replace the default
	-- fn/behavior, which is simply to write all modified (i.e. 'mod' option is
	-- set) buffers. See lua/sos/impl.lua for the default behavior/fn. Any value
	-- returned by this function is ignored. `vim.api.*` can be used inside this
	-- fn (this fn will be called with `vim.schedule()`).
	-- on_timer = require("sos.impl").on_timer,
}

