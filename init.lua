-- Configuration file for neovim.
-- Base config comes from vyrrho@youtube
-- The config files listed below are in /lua
--
--
-- General configuration options
vim.g.mapleader = " "
require("options")

-- Lazy plugin manager and plugins
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



require("lazy").setup("plugins")


