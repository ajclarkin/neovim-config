return {
  {
    "R-nvim/R.nvim",
    lazy = false,
    opts = {
      -- hook = {
      --   on_filetype = function()
      --     vim.opt.expandtab = true
      --     vim.opt.tabstop = 2
      --     vim.opt.softtabstop = 2
      --     vim.opt.shiftwidth = 2
      --   end,
      -- },

      pdfviewer = "zathura",
      -- The html options are "no", "open", "open and focus"
      open_html = "open and focus",
      pipe_version = "magrittr"
    },
  },

  {
    "R-nvim/cmp-r",
    config = function ()
      require("cmp_r").setup({
        filetypes = { "r", "rmd", "quarto" }, -- adjust as needed
        -- other cmp-r options
      })
    end
  }
}
