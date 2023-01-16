local M = {}

function M.neoscroll()
	local t    = {}
	-- Syntax: t[keys] = {function, {function arguments}}
	t['<C-u>'] = { 'scroll', { '-vim.wo.scroll', 'true', '100' } }
	t['<C-d>'] = { 'scroll', { 'vim.wo.scroll', 'true', '100' } }
	t['<C-b>'] = { 'scroll', { '-vim.api.nvim_win_get_height(0)', 'true', '450' } }
	t['<C-f>'] = { 'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '450' } }
	t['<C-y>'] = { 'scroll', { '-0.10', 'true', '100' } }
	t['<C-e>'] = { 'scroll', { '0.10', 'true', '100' } }
	t['zt']    = { 'zt', { '250' } }
	t['zz']    = { 'zz', { '250' } }
	t['zb']    = { 'zb', { '250' } }

	require('neoscroll.config').set_mappings(t)

	require('neoscroll').setup({
		respect_scrolloff = false,
		cursor_scrolls_alone = false

	})
end

M.tabout = {
	tabkey = '%', -- key to trigger tabout, set to an empty string to disable
	backwards_tabkey = "<S-%>", -- key to trigger backwards tabout, set to an empty string to disable
	act_as_tab = true, -- shift content if tab out is not possible
	act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
	default_tab = '<C-t>', -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
	default_shift_tab = '<C-d>', -- reverse shift default action,
	enable_backwards = true, -- well ...
	completion = true, -- if the tabkey is used in a completion pum
	tabouts = {
		{ open = "'", close = "'" },
		{ open = '"', close = '"' },
		{ open = '`', close = '`' },
		{ open = '(', close = ')' },
		{ open = '[', close = ']' },
		{ open = '{', close = '}' }
	},
	ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
	exclude = {}
}

function M.hop()
	local hop = require('hop')
	hop.setup(
		{ keys = 'etovxqpdygfblzhckisuran' }
	)
	local directions = require('hop.hint').HintDirection
	vim.keymap.set('', 'f', function()
		hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
		end, { remap = true })
	vim.keymap.set('', 'F', function()
		hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
		end, { remap = true })
	vim.keymap.set('', 't', function()
		hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
		end, { remap = true })
	vim.keymap.set('', 'T', function()
		hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
		end, { remap = true })
end


 function M.comment()
	return {
		pre_hook = function(ctx)
			local U = require "Comment.utils"

			local location = nil
			if ctx.ctype == U.ctype.block then
				location = require("ts_context_commentstring.utils").get_cursor_location()
			elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
				location = require("ts_context_commentstring.utils").get_visual_start_location()
			end

			return require("ts_context_commentstring.internal").calculate_commentstring {
				key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
				location = location,
			}
		end,
	}
end

M.npairs = {
	check_ts = true,
	ts_config = {
		lua = { "string", "source" },
		javascript = { "string", "template_string" },
		java = false,
	},
	disable_filetype = { "TelescopePrompt", "spectre_panel" },
	fast_wrap = {
		map = "<M-e>",
		chars = { "{", "[", "(", '"', "'" },
		pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
		offset = 0, -- Offset from pattern match
		end_key = "$",
		keys = "qwertyuiopzxcvbnmasdfghjkl",
		check_comma = true,
		highlight = "PmenuSel",
		highlight_grey = "LineNr",
	},
}

return M
