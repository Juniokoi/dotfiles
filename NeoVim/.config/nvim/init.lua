-- Plugin Manager
require("juniokoi.packer")          -- Main plugin manager

-- Options
require("juniokoi.set")             -- NeoVim Settings
require("juniokoi.keymaps")         -- Shortcuts

-- Tools
require("juniokoi.cmp")             -- Autocompletion
require("juniokoi.lsp")             -- Lisp Server
require("juniokoi.dap")

-- Helpers
require("juniokoi.telescope")       -- Find everything within a second
require("juniokoi.toggleterm")      -- Generates a terminal as a popup
require("juniokoi.impatient")
--[[ require("juniokoi.autopairs")       -- Make easier to code ]]

-- Essential
require("juniokoi.comment")         -- Enable commenting code way easier
require("juniokoi.treesitter")      -- Prettify the code, giving colors
require("juniokoi.nvim-tree")       -- Because the stardand one sucks

-- Theme related
require("juniokoi.lualine")         -- Manages the underbar info
require("juniokoi.bufferline")      -- Manages tabs and buffers
require("juniokoi.gitsigns")        -- Show the user what lines and files did change with Git

require("juniokoi.whichkey")
require("juniokoi.alpha")
require("juniokoi.project")
require("juniokoi.indent")
require("juniokoi.colorizer")       -- Show hashcolors
require("juniokoi.git")       -- Show hashcolors

