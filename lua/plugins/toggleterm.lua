return {
  -- {'akinsho/toggleterm.nvim', version = "*", config = true}
  -- or
  {'akinsho/toggleterm.nvim',
    version = "*", 
    -- opts = {--[[ things you want to change go here]]
    --
    -- },

    -- config = function()
    --   vim.keymap.set("n", "t", ":ToggleTerm<CR>", {})
    -- end,
    --
    config = true
  },

-- ToggleTerm keyboard shortcuts 
vim.keymap.set("n", "t", ":ToggleTerm direction=float <CR>")
}

