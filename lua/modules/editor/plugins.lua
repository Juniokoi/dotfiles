local config = { require'modules.editor.config' }

return {
	-- Autopairs
	{ "karb94/neoscroll.nvim", config = config.neoscroll },
	{ "windwp/nvim-autopairs", config = config.npairs }, -- Autopairs, integrates with both cmp and treesitter
	{ "numToStr/Comment.nvim", config = true }, -- Easily comment stuff
	{ "phaazon/hop.nvim" ,
		version = 'v2', -- optional but strongly recommended
		config = config.hop
	},
	{ "kylechui/nvim-surround", config = true },
	{ "ThePrimeagen/harpoon" },
	{ "github/copilot.vim" },
	{
		"abecodes/tabout.nvim",
		config = config.tabout,
	},
	{ "nvim-lua/popup.nvim" },
	{
		"mg979/vim-visual-multi",
		name = "multicursor"
	},

	{ "folke/zen-mode.nvim" },
	{ "norcalli/nvim-colorizer.lua", config = true },
	{ "tpope/vim-sleuth" }, -- Detect tabstop and shiftwidth automatically
}
