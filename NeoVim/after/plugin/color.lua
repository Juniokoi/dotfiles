local status_ok, colorscheme = pcall(require, "catppuccin")
if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. " not found!")
    vim.cmd("colorscheme default")
    return
end
local ok, ucolors = pcall(require, "catppuccin.utils.colors")
if not ok then
    return
end

vim.cmd("colorscheme catppuccin")

vim.g.catppuccin_flavour = "mocha"
vim.opt.background = "dark"


colorscheme.setup {
    flavour = "mocha", -- mocha, macchiato, frappe, latte
    transparent_background = true,
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        dashboard = true,
        neotree = true,
        treesitter_context = true,
        telescope = true,
        treesitter = true,
        ts_rainbow = true,
        which_key = true,
    },
    styles = {
        conditionals = { "italic" },
        numbers = { "bold" },
        operators = { "bold" },
        booleans = { "bold" },
    },
    highlight_overrides = {
        all = {
            Comment = { fg = ucolors.darken("#1e1e2e", 0.3, "#b4befe") },
            CursorColumn = { bg = ucolors.darken("#1e1e2e", 0.9, "#b4befe") },
            CursorLine = { bg = ucolors.darken("#1e1e2e", 0.8, "#b4befe") },
        },
        mocha = function(cp)
            return {
                CursorLineNr = { fg = cp.green },
            }
        end,
    },
}

