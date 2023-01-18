local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
require('nvim-treesitter.configs').setup {
	-- Add languages to be installed here that you want installed for treesitter
	ensure_installed = { 'c_sharp', 'c', 'cpp', 'go', 'lua', 'javascript', 'rust', 'typescript', 'help', 'vim' },

	highlight = { enable = true },
	indent = { enable = true, disable = { 'python' } },
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = '<c-/>',
			node_incremental = '<c-/>',
			scope_incremental = '<c-s>',
			node_decremental = '<c-/>',
		},
	},

	autopairs = {
		enable = false,
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = true,
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
			keymaps = {
				['aa'] = '@parameter.outer',
				['ia'] = '@parameter.inner',
				['af'] = '@function.outer',
				['if'] = '@function.inner',
				['ac'] = '@class.outer',
				['ic'] = '@class.inner',
			}
		},
	},
	move = {
		enable = true,
		set_jumps = true, -- whether to set jumps in the jumplist
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
}
swap = {
	enable = true, swap_next = {
		['<leader>a'] = '@parameter.inner',
	},
	swap_previous = {
		['<leader>A'] = '@parameter.inner',
	},
}
