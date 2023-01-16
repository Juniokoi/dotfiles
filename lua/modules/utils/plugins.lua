local keymaps = require('misc.keymaps').telescope
local opts = {
	neotree = require('modules.utils.nvimtree')
}

return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		},
		cmd = "Neotree",
		config = opts.neotree.config()
	},
	{ "nvim-lua/plenary.nvim" },
	{ "tpope/vim-rhubarb" },
	{ "lewis6991/gitsigns.nvim" },
	{ "lewis6991/gitsigns.nvim" },
	{ "moll/vim-bbye" }, -- Close window without messing up with layout

	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-telescope/telescope-project.nvim",
			"nvim-telescope/telescope-media-files.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
			"nvim-telescope/telescope-frecency.nvim",
			"kkharji/sqlite.lua"
		},
		config = function()
			require('telescope').setup {

				extensions = {
					file_browser = {
						theme = "ivy",
						hijack_netrw = true,
						mappings = {
							keymaps.file_browser
						}
					}
				},
				defaults = {
					keymaps.defaults
				}
			}

			pcall(require('telescope').load_extension, 'fzf')
			pcall(require('telescope').load_extension, 'frecency')
			pcall(require('telescope').load_extension, 'projects')
			pcall(require('telescope').load_extension, 'file_browser')
		end,
	},
	{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
}
