local fn, uv, api = vim.fn, vim.loop, vim.api
local global = require "core.global"
local vim_path = global.vim_path
local modules_dir = vim_path .. "lua/modules"

	local get_plugins_list = function()
		local list = {}
		local tmp = vim.split(fn.globpath(modules_dir, "*/plugins.lua"), "\n")
		local subtmp = vim.split(fn.globpath(modules_dir, "*/user/plugins.lua"), "\n")
		print(tmp)
		print(subtmp)
		for _, v in ipairs(subtmp) do
			if v ~= "" then
				table.insert(tmp, v)
			end
		end
		for _, f in ipairs(tmp) do
			-- fill list with `plugins.lua`'s path used for later `require` like this:
			-- list[#list + 1] = "modules/completion/plugins.lua"
			list[#list + 1] = f:sub(#modules_dir - 6, -1)
			print(list[1])
		end
		return list
	end
get_plugins_list()
