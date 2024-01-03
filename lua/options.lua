-- This file is called by init.lua
-- You can find all these options by running command :options

-- Set line numbering
vim.opt.number = true
vim.opt.relativenumber = true


-- Where additional windows like Help open
vim.opt.splitbelow = true
vim.opt.splitright = true


-- Turn off word wrap
vim.opt.wrap = false


-- Indent settings. Shiftwidth is for when we use indent operator >>
vim.opt.expandtab = true
vim.opt.tabstop = 4 
vim.opt.shiftwidth = 4


-- Cut and copy to system clipboard
vim.opt.clipboard = "unnamedplus"

vim.opt.scrolloff = 999



-- Allow virtualedit in visual block mode. :help virtualedit
vim.opt.virtualedit = "block"


-- When performing substitution (:%s/find/replace) show all the changes in split window rather than on screen
vim.opt.inccommand = "split"


vim.opt.termguicolors = true

vim.g.mapleader = " "
