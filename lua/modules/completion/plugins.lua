local conf = require('modules.completion.config')

return {
	{
		"neovim/nvim-lspconfig",
		lazy = true,
		dependencies = {
			-- lsp support
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"jose-elias-alvarez/null-ls.nvim",

			"b0o/SchemaStore.nvim",
			-- json schemas
		},
		config = conf.lsp
	},

	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lsp",
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip",
			"JoosepAlviste/nvim-ts-context-commentstring", -- Comment on .TS Files
			"windwp/nvim-ts-autotag" ,
		}
	},

	{ "j-hui/fidget.nvim", config = true },
	{ "folke/neodev.nvim", config = true },

	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/playground",
			"nvim-treesitter/nvim-treesitter-textobjects" 
		},
		config = conf.treesitter,
		build = function()
			pcall(require('nvim-treesitter.install').update { with_sync = true })
	end
	},


	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap" },
		config = conf.dap
	},

	{ "elkowar/yuck.vim", dependencies = { "gpanders/nvim-parinfer" } },
}
