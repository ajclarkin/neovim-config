-- This file is called by init.lua
-- You can find all these options by running command :options

-- Nerd font
vim.g.have_nerd_font = true


-- Set line numbering
vim.opt.number = true
vim.opt.relativenumber = true

-- Remove the signcolumn which are the symbols appearing to the left of the line number
-- To turn back on temporarily type :set scl=auto (appear only when something to show) or :set scl=yes
vim.opt.signcolumn = 'no'

-- Where additional windows like Help open
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Turn off word wrap
vim.opt.wrap = false

-- Indent settings. Shiftwidth is for when we use indent operator >>
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- Cut and copy to system clipboard
vim.opt.clipboard = "unnamedplus"

vim.opt.scrolloff = 999

-- Allow virtualedit in visual block mode. :help virtualedit
vim.opt.virtualedit = "block"

-- When performing substitution (:%s/find/replace) show all the changes in split window rather than on screen
vim.opt.inccommand = "split"

vim.opt.termguicolors = true

-- Show the line that the curson is on
vim.opt.cursorline = true

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Create a global function to close terminal that can be used with ToggleTerm
-- https://www.reddit.com/r/neovim/comments/1bjhadj/efficiently_switching_between_neovim_and_terminal/
ExitTerm = function()
  vim.cmd(":ToggleTerm");
end

