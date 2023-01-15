return {
	{	"neovim/nvim-lspconfig",
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
"mfussenegger/nvim-dap",
{ "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap"} },
"karb94/neoscroll.nvim",
	'creativenull/efmls-configs-nvim',

	}
