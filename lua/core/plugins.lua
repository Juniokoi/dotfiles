return {
    {
        "kylechui/nvim-surround",
        lazy = false,
        config = true
    },
    {"nvim-lua/plenary.nvim"},
    {"nvim-lua/popup.nvim"},
    {"numToStr/Comment.nvim", lazy = false }, -- Easily comment stuff
    {
        "mg979/vim-visual-multi",
        name = "multicursor"
    },
    {"ThePrimeagen/harpoon"},

    -- Themes
    {"folke/tokyonight.nvim"}, --TOKYOOOOOOOOOOO,
    {
        "catppuccin/nvim",
        lazy = false,
        priority = 1000,
        name = "catppuccin",
    },
    {
        'nvim-lualine/lualine.nvim',
        lazy = false,
        dependencies = "kyazdani42/nvim-web-devicons"
    },
    {"akinsho/bufferline.nvim", event = "VeryLazy", config = true},

    -- Snippets
    -- {"l3mon4d3/luasnip",event = "VeryLazy", lazy = true, ft = "lua", config = true}, --snippet engine
    -- {"rafamadriz/friendly-snippets"}, -- a bunch of snippets to use
    --
    --
    -- Telescope
    {"nvim-telescope/telescope.nvim"},
    {"nvim-telescope/telescope-media-files.nvim"},

    -- Treesitter
    {
        lazy = true,
        "nvim-treesitter/nvim-treesitter",
    },
    --"p00f/nvim-ts-rainbow"

    {"nvim-treesitter/playground"},

    -- Autopairs
    {"windwp/nvim-autopairs"}, -- Autopairs, integrates with both cmp and treesitter

    -- Comments
    {"JoosepAlviste/nvim-ts-context-commentstring"}, -- Comment on .TS Files

    {"akinsho/toggleterm.nvim"},


    {"lukas-reineke/indent-blankline.nvim"}, -- Make code prettier
    {"ahmedkhalf/project.nvim"}, -- Handles projects

    -- Git
    {"lewis6991/gitsigns.nvim"},
    {"f-person/git-blame.nvim"},
    {"mattn/vim-gist"},
    {"mattn/webapi-vim"},
    {"ruifm/gitlinker.nvim"},

    -- Github
    {"pwntester/octo.nvim"},

    -- Typescript
    {"windwp/nvim-ts-autotag"},

    --Lsp-zero
    {
        "VonHeikemen/lsp-zero.nvim",
        dependencies = {
            -- LSP Support
            "neovim/nvim-lspconfig",
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",

            -- Autocompletion
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            { "saadparwaiz1/cmp_luasnip", ft = "lua" },
            "hrsh7th/cmp-nvim-lsp",
            { "hrsh7th/cmp-nvim-lua", ft = "lua" },

            -- Snippets
            { "L3MON4D3/LuaSnip", ft = "lua" }, -- Snippet Collection (Optional)
            "rafamadriz/friendly-snippets"
        },
        event = "VeryLazy",
        opts = function()
            return {
                preset = "recommended",
                ensure_installed = {
                    'tsserver',
                    'eslint',
                    'sumneko_lua',
                },
                configure = {
                    "tsserver", {
                        on_attach = function(client, bufnr)
                            print('hello tsserver')
                        end,
                        settings = {
                            completions = {
                                completeFunctionCalls = true
                            }
                        }
                    }
                },
                set_preferences = {
                    sign_icons = {
                        error = 'E',
                        warn = 'W',
                        hint = 'H',
                        info = 'I'
                    }
                }
            }
        end
    },
    -- Yuck
    {"elkowar/yuck.vim"},
    {"gpanders/nvim-parinfer"},

    {"folke/zen-mode.nvim"},
    {"norcalli/nvim-colorizer.lua"},

    {"moll/vim-bbye"}, -- Close window without messing up with layout

    { "stevearc/dressing.nvim", event = "VeryLazy" },
}
