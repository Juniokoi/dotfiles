function Set_Leader_Key()
	vim.keymap.set("", "<Space>", "<Nop>")
	vim.g.mapleader = " "
	vim.g.maplocalleader = " "
end

function load_core()
	Set_Leader_Key()
	require("core.lazy")
	require("core.settings")
	require'misc.keymaps'
end

load_core()
