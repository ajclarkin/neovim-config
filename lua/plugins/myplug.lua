return {
  dir = "~/.config/nvim/lua/myplug/",
  name = "myplug",
  dev = true, -- Use local plugin (not from GitHub)
  config = function()
    -- Create a command to open the floating window
    vim.api.nvim_create_user_command("MyPlug1", function()
      require("myplug").open_floating_window()
    end, {})

    -- Optional: set a keymap (e.g., <leader>fp)
    vim.keymap.set("n", "<leader>mp", function()
      require("myplug").open_floating_window()
    end, { desc = "Open Floating Placeholder" })
  end,
}
