local config = {}

function config.lsp()
	require("modules.completion.lisp")
end

function config.cmp()
	local cmp_status_ok, cmp, cmp_autopairs, luasnip = pcall(require, "cmp", "nvim-autopairs.completion.cmp", "luasnip")
	local cmp_select = { behavior = cmp.SelectBehavior.Select }

	cmp.setup {
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},
		mapping = cmp.mapping.preset.insert({
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
		}),
		sources = {
			{ name = 'nvim_lsp' },
			{ name = 'luasnip' },
		},
	}
	if not cmp_status_ok then
		return
	end
	cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })
end

function config.highlight()
	local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
	vim.api.nvim_create_autocmd('TextYankPost', {
		callback = function()
			vim.highlight.on_yank()
		end,
		group = highlight_group,
		pattern = '*',
	})
end

function config.blankline()
	require('indent_blankline').setup {
		char = '┊',
		show_trailing_blankline_indent = false,
	}
end

function config.gitsigns()
	require('gitsigns').setup {
		signs = {
			add = { text = '+' },
			change = { text = '~' },
			delete = { text = '_' },
			topdelete = { text = '‾' },
			changedelete = { text = '~' },
		},
	}
end

function config.treesitter() 
	require 'modules.completion.treesitter'
end

function config.dap()
	return 'modules.completion.debugger'
end

return config
