local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Sync when save packer.lua file
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost packer.lua source <afile> | PackerSync
    augroup end
]]

-- Protective call, avoid error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Pretty popup when sync
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

---------------------------------------------
-------------  INSTALL HERE -----------------
---------------------------------------------
return packer.startup(function(use)
    -- Just use the syntax "use 'user/repo'" to install new plugins
    --
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-lua/popup.nvim'
    use "numToStr/Comment.nvim" -- Easily comment stuff
    use "lukas-reineke/virt-column.nvim"

    -- Themes
    use 'folke/tokyonight.nvim' --TOKYOOOOOOOOOOO
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use 'akinsho/bufferline.nvim'

    -- Cmp plugins
    use "hrsh7th/nvim-cmp" -- The completion plugin
    use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-path" -- path completions
    use "hrsh7th/cmp-cmdline" -- cmdline completions
    use "saadparwaiz1/cmp_luasnip" -- snippet completions
    use "David-Kunz/cmp-npm" -- npm completions
    use "hrsh7th/cmp-nvim-lua"
    use "hrsh7th/cmp-nvim-lsp"
    use "moll/vim-bbye" -- Confirm if want to quit
    use({
        "folke/noice.nvim",
        event = "VimEnter",
        requires = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "muniftanjim/nui.nvim",
            "rcarriga/nvim-notify",
        }
    })

    -- nvim tree
    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'

    -- snippets
    use "l3mon4d3/luasnip" --snippet engine
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

    -- lsp
    use "neovim/nvim-lspconfig" -- enable lsp
    use "williamboman/nvim-lsp-installer" -- simple to use language server installer
    use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

    -- Telescope
    use "nvim-telescope/telescope.nvim"
    use 'nvim-telescope/telescope-media-files.nvim'

    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }
    use "p00f/nvim-ts-rainbow"
    use "nvim-treesitter/playground"

    -- Autopairs
    use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter

    -- Comments
    use 'JoosepAlviste/nvim-ts-context-commentstring' -- Comment on .TS Files

    use 'akinsho/toggleterm.nvim'

    use 'lukas-reineke/indent-blankline.nvim' -- Make code prettier
    use 'ahmedkhalf/project.nvim' -- Handles projects
    use 'goolord/alpha-nvim' -- Creates the dashboard
    use 'lewis6991/impatient.nvim' -- Makes vim start faster
    use 'https://github.com/folke/which-key.nvim'
    -- Git
    use "lewis6991/gitsigns.nvim"

    -- Java
    use 'mfussenegger/nvim-jdtls'
    use 'mfussenegger/nvim-dap'
    use 'rcarriga/nvim-dap-ui'







    -- Don't touch, it's art!
    --
    -- Automatically set up your configuration after cloning packer.nvim
    -- Have to be in the end of all plugins to be effective
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
