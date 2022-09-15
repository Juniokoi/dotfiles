local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
    return
end

local mappings = {
    ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
    ["d"] = { "<cmd>Alpha<CR>", "Dashboard" },
    c = {
        name = "Configuration",
        c = {"<cmd>edit $HOME/.config/nvim/after/plugin/color.lua<cr>", "Colorscheme" },
        C = {"<cmd>edit $HOME/.config/nvim/init.lua<cr>", "Configs" },
        w = {"<cmd>edit $HOME/.config/nvim/lua/keymaps/whichkey.lua<cr>", "Which Key" },
        p = {"<cmd>edit $HOME/.config/nvim/lua/core/packer.lua<cr>", "Plugins" },
    },
    ["j"] = {"<cmd>w! | so<CR>", "Source file" },
    f = {
        name = "File",
        s = { "<cmd>w!<CR>", "Save" },
    },
    ["F"] = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
    g = {
        name = "Git",
        g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
        j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
        k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
        l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
        p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
        r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
        R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
        s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
        u = {
            "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
            "Undo Stage Hunk",
        },
        o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
        b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
        c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
        d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Diff", },
    },
    h = {
        name = "Harpoon",
        h = {"<cmd>lua require 'harpoon.ui'.toggle_quick_menu()<cr>", "List" },
        a = {"<cmd>lua require 'harpoon.mark'.add_file()<cr>", "Add" }, },
    ["H"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
    l = {
        name = "LSP",
        a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
        d = { "<cmd>Telescope lsp_document_diagnostics<cr>", "Document Diagnostics", },
        w = { "<cmd>Telescope lsp_workspace_diagnostics<cr>", "Workspace Diagnostics", },
        f = { "<cmd>lua vim.lsp.buf.format{async=true}<cr>", "Format" },
        i = { "<cmd>LspInfo<cr>", "Info" },
        I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
        j = { "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", "Next Diagnostic", },
        k = { "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", "Prev Diagnostic", },
        l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
        q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
        r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
        s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
        S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" },
    },
    o = {
        name = "Open",
        f = { "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>", "Open file", },
    },
    ["p"] = { ":Telescope projects <CR>", "Projects" },
    ["r"] = { ":Telescope oldfiles <CR>", "Recent files" },
    s = {
        name = "Search",
        b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
        C = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
        c = {"<cmd>lua require'telescope.builtin'.find_files({ find_files = 'fd * $HOME/.config/nvim/ '})<CR>", "Config files" },
        h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
        M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
        r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
        R = { "<cmd>Telescope registers<cr>", "Registers" },
        k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
        C = { "<cmd>Telescope commands<cr>", "Commands" },
    },
    t = {
        name = "Terminal",
        t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
        f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
        h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
        v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
    },
    w = {
        name = "Window", 
        f = { "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>", "Buffers", },
        c = { "<cmd>Bdelete!<CR>", "Close Buffer", },
        q = { "<cmd>%bdelete | :Alpha<CR>", "Close everything", },
    }
}

local opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
}

which_key.register(mappings, opts)
