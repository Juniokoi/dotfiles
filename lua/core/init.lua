function Set_Leader_Key()
	vim.keymap.set("", "<Space>", "<Nop>")
	vim.g.mapleader = " "
	vim.g.maplocalleader = " "
end

local function load_core()
	Set_Leader_Key()
	require("core.lazy")
	require("keymaps.keymaps")
	require("modules.completions.lisp")
	require("modules.ui.config")
end

load_core()
