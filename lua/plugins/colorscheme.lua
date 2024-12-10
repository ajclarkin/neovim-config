-- return {
--     "navarasu/onedark.nvim",
--     config = function()
--         vim.cmd.colorscheme("onedark")
--     end,
-- }

return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    -- opts = {
    --   color_overrides = {
    --   frappe = {
    --       -- base = "#1c1917",  -- Set this to your preferred charcoal color
    --       base = "#ffffff",  -- Set this to your preferred charcoal color
    --     }
    --   }
    -- },
    config = function()
      vim.cmd.colorscheme "catppuccin-frappe"
    end
  }
}

