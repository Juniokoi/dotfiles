return {
	{ "neovim/nvim-lspconfig",
		lazy = true,
		dependencies = {
			-- lsp support
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"jose-elias-alvarez/null-ls.nvim",

			-- autocompletion
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lsp",
			"saadparwaiz1/cmp_luasnip",
			'L3MON4D3/LuaSnip',
			'j-hui/fidget.nvim',

			"b0o/SchemaStore.nvim",
			-- json schemas
			'folke/neodev.nvim',

		},
		config = function()
		end
	},

	{ "JoosepAlviste/nvim-ts-context-commentstring" }, -- Comment on .TS Files

	'nvim-treesitter/nvim-treesitter-textobjects',
	{ "nvim-treesitter/playground" },
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			pcall(require('nvim-treesitter.install').update { with_sync = true })
		end
	},
	{ "windwp/nvim-ts-autotag" },

	"mfussenegger/nvim-dap",
	{ "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap" } },

	{ "elkowar/yuck.vim" },
	{ "gpanders/nvim-parinfer" },
}
