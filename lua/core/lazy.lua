local fn = vim.fn

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    {
      import = "modules.ui.plugins",
      opts = {},
    },
    { import = "modules.completion.plugins" },
    { import = "modules.editor.plugins" },
    { import = "modules.utils.plugins" },
  },
  defaults = { lazy = false },
  install = { colorscheme = { "kanagawa" } },
  checker = { enabled = true },
  diff = {
    cmd = "terminal_git",
  },
  performance = {
    cache = {
      enabled = true,
      -- disable_events = {},
    },
  }
  --ui = {
    --custom_keys = {
      --[" "] = function()
      --end,
    --},
  --},
})
