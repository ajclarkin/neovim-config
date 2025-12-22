return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup()

      vim.keymap.set("n", "tt", "<cmd>1ToggleTerm direction=float <CR>", { desc = "Toggle floating terminal" })
      vim.keymap.set("n", "tp", function()
        vim.cmd.write()
        -- Use a dedicated terminal number for running files, e.g. 2
        vim.cmd("2TermExec size=20 direction=float go_back=0 cmd='python %'")
      end, { desc = "Save and run current file in python (term 2)" })
      vim.keymap.set("t", "<C-x>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
      vim.keymap.set("t", "<Esc><Esc>", "<cmd>ToggleTerm<CR>", { desc = "Term: close with Esc Esc" })
    end,
  },
}

