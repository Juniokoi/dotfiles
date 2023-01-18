local conf = require("modules.ui.config")

return {
	{
		'nvim-lualine/lualine.nvim',
		lazy = false,
		dependencies = "kyazdani42/nvim-web-devicons",
		opts = require'modules.ui.lualine'
	},

	{ "stevearc/dressing.nvim", event = "VeryLazy" },

	{ "goolord/alpha-nvim", config = conf.alpha },

	{
		"echasnovski/mini.animate",
		event = "BufRead",
		config = function()
				return require('modules.ui.config').animate
		end
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
