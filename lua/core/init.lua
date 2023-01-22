local function set_leader_key()
	vim.keymap.set("", "<Space>", "<Nop>")
	vim.g.mapleader = " "
	vim.g.maplocalleader = " "
end

local function load_core()
	set_leader_key()
	require("core.settings")
	require("core.lazy")
	require'misc.keymaps'
end

load_core()
