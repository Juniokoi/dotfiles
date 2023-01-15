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
      import = "plugins",
      opts = {},
    },
    --{ import = "lazyvim.plugins.extras.lang.typescript" },
    --{ import = "lazyvim.plugins.extras.lang.json" },
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
