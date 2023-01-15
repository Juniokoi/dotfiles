
return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = function ()
			pcall(require('nvim-treesitter.install').update { with_sync = true})
		end
	},
	{'abecodes/tabout.nvim',
		version = 'v2', -- optional but strongly recommended
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
		end
	},
	"github/copilot.vim",
	'nvim-treesitter/nvim-treesitter-textobjects',
	{
		"kylechui/nvim-surround",
		lazy = false,
		config = true
	},
	'phaazon/hop.nvim',
	{"nvim-lua/plenary.nvim"},
	{"nvim-lua/popup.nvim"},
	{"numToStr/Comment.nvim", lazy = false }, -- Easily comment stuff
	{
		"mg979/vim-visual-multi",
		name = "multicursor"
	},
	{"ThePrimeagen/harpoon"},

	-- Themes
	{
		"rebelot/kanagawa.nvim", --TOKYOOOOOOOOOOO,
		lazy = false,
		priority = 1000,
	},
	{
		'nvim-lualine/lualine.nvim',
		lazy = false,
		dependencies = "kyazdani42/nvim-web-devicons"
	},
	{"akinsho/bufferline.nvim", event = "VeryLazy", config = true},

	-- Telescope
	{"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-telescope/telescope-project.nvim",
			"nvim-telescope/telescope-media-files.nvim",
			"nvim-telescope/telescope-file-browser.nvim"
		}
	},
	{
		"nvim-telescope/telescope-frecency.nvim",
		config = function()
			require"telescope".load_extension("frecency")
		end,
		dependencies = {"kkharji/sqlite.lua"}
	},
	"echasnovski/mini.animate",
	"goolord/alpha-nvim",
	"Shatur/neovim-session-manager",
	{"nvim-treesitter/playground"},

	-- Autopairs
	{"windwp/nvim-autopairs"}, -- Autopairs, integrates with both cmp and treesitter

	-- Comments
	{"JoosepAlviste/nvim-ts-context-commentstring"}, -- Comment on .TS Files
	{"akinsho/toggleterm.nvim",
},


	{"lukas-reineke/indent-blankline.nvim"}, -- Make code prettier
	{"ahmedkhalf/project.nvim"}, -- Handles projects

	-- Git
	{"lewis6991/gitsigns.nvim"},
	'tpope/vim-rhubarb',
	'lewis6991/gitsigns.nvim',
	'lukas-reineke/indent-blankline.nvim',

	{
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
	},
	cmd = "Neotree",
	config = true
	},
	{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
	'tpope/vim-sleuth',-- Detect tabstop and shiftwidth automatically

	-- Github
	{"pwntester/octo.nvim"},

	-- Typescript
	{"windwp/nvim-ts-autotag"},

	--Lsp-zero
	-- Yuck
	{"elkowar/yuck.vim"},
	{"gpanders/nvim-parinfer"},

	{"folke/zen-mode.nvim"},
	{"norcalli/nvim-colorizer.lua"},

	{"moll/vim-bbye"}, -- Close window without messing up with layout

	{ "stevearc/dressing.nvim", event = "VeryLazy" },
}
