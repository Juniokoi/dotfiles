local ok, kanagawa = pcall(require, "kanagawa")
if not (ok or kanagawa) then
	vim.cmd("colorscheme desert")
	print("Error while loading colorscheme")
	return
end

local colors = require("kanagawa.colors").setup()
local border_color = colors.winterBlue


require('kanagawa').setup({
	undercurl = true,           -- enable undercurls
	commentStyle = { italic = true },
	functionStyle = {},
	keywordStyle = { italic = true},
	statementStyle = { bold = true },
	typeStyle = {},
	variablebuiltinStyle = { italic = true},
	specialReturn = true,       -- special highlight for the return keyword
	specialException = true,    -- special highlight for exception handling keywords
	transparent = true,        -- do not set background color
	dimInactive = false,        -- dim inactive window `:h hl-NormalNC`
	globalStatus = false,       -- adjust window separators highlight for laststatus=3
	terminalColors = true,      -- define vim.g.terminal_color_{0,17}
	colors = { 
		fujiWhite = "#E3deea",
		oldFujiWhyte = "#Cdc6d8"
	},
	overrides = {
		CursorLineNr = {
			fg = colors.springGreen,
			bg = border_color,
			bold = true
		},
		LineNr = {
			fg = colors.boatYellow1,
			bg = border_color 
		},
		SignColumn = { bg = border_color },
		--
		String = { fg = colors.autumnYellow },
		Comment = { fg = colors.oniViolet, italic = true },
	},
	theme = "default"           -- Load "default" theme or the experimental "light" theme
})


vim.cmd("colorscheme kanagawa")
