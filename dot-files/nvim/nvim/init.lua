-- ~/.config/nvim/init.lua
-- Bootstrap lazy.nvim if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim with your plugin specs
require("lazy").setup({
  spec = {
    { "LazyVim/LazyVim", import = "lazyvim.plugins" }, -- LazyVim core plugins
    { import = "plugins" }, -- your custom plugins (lua/plugins/*.lua)
  },
  defaults = {
    lazy = false, -- load plugins eagerly by default
    version = false, -- always use latest git commit
  },
  checker = {
    enabled = true, -- automatically check for plugin updates
    notify = false, -- do not notify on update check
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
