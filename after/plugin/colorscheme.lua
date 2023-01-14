local ucolors = require "catppuccin.utils.colors"

vim.cmd("colorscheme catppuccin")

require("catppuccin").setup {
	flavour = "frappe", -- mocha, macchiato, frappe, latte
	transparent_background = true,
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		dashboard = true,
		neotree = true,
		treesitter_context = true,
		telescope = true,
		treesitter = true,
		ts_rainbow = true,
		which_key = true,
	},
	styles = {
		conditionals = { "italic" },
		numbers = { "bold" },
		operators = { "bold" },
		booleans = { "bold" },
	},
	--custom_highlights = function(colors)
		--return {
			--LineNr = { fg = colors.teal },
			--Whitespace = { fg = ucolors.darken( colors.base, 0.3,colors.teal ) },
			--NonText = { fg = colors.mauve, bg = colors.none },
		--}
	--end,
	highlight_overrides = {
		all = function(cp)
			return {
				CursorColumn = { bg = ucolors.darken(cp.base, 0.9, "#b4befe") },
				CursorLine = { bg = ucolors.darken("#1e1e2e", 0.8, "#b4befe") },
				CursorLineNr = { fg = cp.green, bold = true },
				LineNr = { fg = cp.flamingo },
				Whitespace = { fg = ucolors.darken( cp.base, 0.5,cp.teal ) },
				NonText = { fg = cp.flamingo },
				Comment = { fg = ucolors.darken("#1e1e2e", 0.5, "#b4befe") },
			}
		end,
		mocha = function(cp)
			return {
			}
		end,
	},
}
