local M = {}

function M.global()
	require"keymaps.misc"
end

function M.treesitter()
	local O = {}
	
	O.incremental_keymaps {
		init_selection = '<c-/>',
		node_incremental = '<c-/>',
		scope_incremental = '<c-s>',
		node_decremental = '<c-/>',
	}
	O.select {
		['aa'] = '@parameter.outer',
		['ia'] = '@parameter.inner',
		['af'] = '@function.outer',
		['if'] = '@function.inner',
		['ac'] = '@class.outer',
		['ic'] = '@class.inner',
	}
	O.move = function()
		return {
			goto_next_start = {
				[']m'] = '@function.outer',
				[']]'] = '@class.outer',
			},
			goto_next_end = {
				[']M'] = '@function.outer',
				[']['] = '@class.outer',
			},
			goto_previous_start = {
				['[m'] = '@function.outer',
				['[['] = '@class.outer',
			},
			goto_previous_end = {
				['[M'] = '@function.outer',
				['[]'] = '@class.outer',
			},
		}
	end

	O.swap = function()
		return {
			swap_next = {
				['<leader>a'] = '@parameter.inner',
			},
			swap_previous = {
				['<leader>A'] = '@parameter.inner',
			},
		}
	end

	return O

end


function M.cmp()
	local cmp = require('cmp')
	local cmp_select = { behavior = cmp.SelectBehavior.Select }

	return {
		['<C-u>'] = cmp.mapping.scroll_docs(-4),
		['<C-d>'] = cmp.mapping.scroll_docs(4),
		['<CR>'] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		},
		['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
		['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
		['<C-y>'] = cmp.mapping.confirm({ select = true }),
		["<C-Space>"] = cmp.mapping.complete({ select = false }),
	}
end

function M.telescope()
	local O = {}
	local actions = require 'telescope.actios'
	O.file_browser {
		i = {
			["<esc>"] = false
		}
	}
	O.defaults {
		mappings = {
			i = {
				--['<C-u>'] = true,
				--['<C-d>'] = true,
				["<esc>"] = "close",
				["<C-j>"] = {
					actions.move_selection_next, type = "action",
					opts = { nowait = true, silent = true },

				},
				["<C-k>"] = {
					actions.move_selection_previous, type = "action",
					opts = { nowait = true, silent = true }
				},
			},
			n = {

				["<esc>"] = "close",
				["<C-j>"] = {
					actions.move_selection_next, type = "action",
					opts = { nowait = true, silent = true },

				},
				["<C-k>"] = {
					actions.move_selection_previous, type = "action",
					opts = { nowait = true, silent = true }
				},
			},
		},
	}
	return O
end

return M
