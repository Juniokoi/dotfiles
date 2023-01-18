local opts = { noremap = true, silent = true }

local term_opts = { silent = true }
-- Shorten function name

local keymap = function(mode, lhs, rhs, desc)
	local _opts = opts
	_opts[2] = desc[1]
	return vim.api.nvim_set_keymap(mode, lhs, rhs, _opts)
end

vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
keymap("n", "<leader>Y", [["+Y]], opts)
-- Insert --
-- Press jk fast to enter
vim.keymap.set({"v","x","i"}, "jk", "<ESC>")

--Remap space as leader key

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", { desc = "move to left window" })
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
--
-- Resize with arrows
keymap("n", "<C-A-k>", ":resize +2<CR>", opts)
keymap("n", "<C-A-j>", ":resize -2<CR>", opts)
keymap("n", "<C-A-h>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-A-l>", ":vertical resize +2<CR>", opts)

--
-- Navigate buffers
keymap("n", "<C-c>", "<Esc>", opts)
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "J", "mzJ`z", opts)
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
keymap("n", "<leader>Y", [["+Y]], opts)
keymap("n", "<leader>q", "<cmd>Bdelete<cr>", opts)
-- Insert --
-- Press jk fast to enter
vim.keymap.set({ "v", "x", "i" }, "jk", "<ESC>")

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
vim.keymap.set({ "v", "n" }, "<A-k>", ":m .-2<CR>==")
vim.keymap.set({ "v", "n" }, "<A-j>", ":m .+1<CR>==")

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

keymap("n", "<C-s>", ":w<cr>", term_opts)

-- Nvimtree
keymap("n", "<leader>e", ":Neotree toggle<cr>", opts)

-- See `help telescope.builtin`
vim.keymap.set('n', '<leader>fr', require('telescope.builtin').oldfiles, { desc = ' [F]ind [R]ecently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = ' [F]ind existing buffers' })
vim.keymap.set('n', '<leader>/', function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
		winblend = 10,
		previewer = false,
	})
end, { desc = '[/] Fuzzily search in current buffer]' })


vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = '[F]ind [F]iles' })
vim.keymap.set('n', '<leader>fp', "<cmd>Telescope project<cr>", { desc = '[F]ind [P]rojects' })
vim.keymap.set('n', '<leader>fe', "<cmd>Telescope frecency<cr>", { desc = '[F]ind fr[E]cency' })
vim.keymap.set('n', '<leader>fb', "<cmd>Telescope file_browser<cr>", { desc = '[F]ind Browser' })
vim.keymap.set('n', '<leader>fw', require('telescope.builtin').grep_string, { desc = '[F]ind current [W]ord' })
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = '[F]ind by [G]rep' })
-- helpers
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').git_files, { desc = '[S]earch (inside) [G]it_files' })
vim.keymap.set('n', '<leader>sk', require('telescope.builtin').keymaps, { desc = '[S]earch [M]appings' })
