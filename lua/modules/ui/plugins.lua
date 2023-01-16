local conf = require("modules.ui.config")

return {
	{
		'nvim-lualine/lualine.nvim',
		lazy = false,
		dependencies = "kyazdani42/nvim-web-devicons",
		opts = require'modules.ui.lualine'
	},

	{ "stevearc/dressing.nvim", event = "VeryLazy" },

	{ "goolord/alpha-nvim", opts = conf.alpha },

	{
		"echasnovski/mini.animate",
		event = "BufRead",
		opts = require'modules.ui.config'.animate()
	},

	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		opts = require'modules.ui.bufferline'
	},

	{ "akinsho/toggleterm.nvim" },

	{
		"rebelot/kanagawa.nvim", --TOKYOOOOOOOOOOO,
		lazy = false,
		priority = 1000,
	},
}
