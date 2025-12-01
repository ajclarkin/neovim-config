local M = {}

function M.open_floating_window()
  local curl = require("plenary.curl")
  local json = vim.json.decode

  -- Fetch gists asynchronously
  curl.get("https://api.github.com/users/ajclarkin/gists", {
    headers = {
      Accept = "application/vnd.github+json",
      ["User-Agent"] = "Neovim"
    },
    callback = function(response)
      if response.status ~= 200 then
        vim.schedule(function()
          vim.notify("GitHub API Error: " .. response.status, vim.log.levels.ERROR)
        end)
        return
      end

      local ok, gists = pcall(json, response.body)
      if not ok or not gists then
        vim.schedule(function()
          vim.notify("Failed to parse GitHub response", vim.log.levels.ERROR)
        end)
        return
      end

      -- Extract descriptions and raw URLs
      local menu_items = {}
      local raw_urls = {}
      for _, gist in ipairs(gists) do
        local desc = gist.description or "[No description]"
        table.insert(menu_items, desc)

        -- Get first file's raw URL
        local first_file = next(gist.files)
        if first_file then
          raw_urls[desc] = gist.files[first_file].raw_url
        end
      end

      if #menu_items == 0 then
        vim.schedule(function()
          vim.notify("No gists found", vim.log.levels.WARN)
        end)
        return
      end

      -- Create floating window
      vim.schedule(function()
        local original_buf = vim.api.nvim_get_current_buf()
        local original_pos = vim.api.nvim_win_get_cursor(0)
        
        local ui = vim.api.nvim_list_uis()[1]
        local width = math.min(80, math.floor(ui.width * 0.8))
        local height = math.min(#menu_items + 4, ui.height - 4)
        local col = math.floor((ui.width - width) / 2)
        local row = math.floor((ui.height - height) / 2)

        local buf = vim.api.nvim_create_buf(false, true)
        local win = vim.api.nvim_open_win(buf, true, {
          relative = "editor",
          width = width,
          height = height,
          col = col,
          row = row,
          style = "minimal",
          border = "rounded",
        })

        -- Build display lines
        local display_lines = {" GitHub Gists ("..#menu_items..") "}
        for i, item in ipairs(menu_items) do
          local line = string.format("%2d. %s", i, vim.fn.strcharpart(item, 0, width - 6))
          table.insert(display_lines, line)
        end
        
        vim.api.nvim_buf_set_lines(buf, 0, -1, false, display_lines)

        -- Set key mappings
        for i, item in ipairs(menu_items) do
          vim.api.nvim_buf_set_keymap(buf, 'n', tostring(i), '', {
            noremap = true,
            silent = true,
            callback = function()
              local raw_url = raw_urls[item]
              if not raw_url then
                vim.notify("No raw URL found for this gist", vim.log.levels.ERROR)
                return
              end

              -- Fetch and insert gist content
              curl.get(raw_url, {
                callback = function(raw_response)
                  if raw_response.status ~= 200 then
                    vim.schedule(function()
                      vim.notify("Failed to fetch gist content: HTTP "..raw_response.status, vim.log.levels.ERROR)
                    end)
                    return
                  end

                  vim.schedule(function()
                    vim.api.nvim_win_close(win, true)
                    local lines = vim.split(raw_response.body, "\n")
                    vim.api.nvim_buf_set_text(
                      original_buf,
                      original_pos[1] - 1,
                      original_pos[2],
                      original_pos[1] - 1,
                      original_pos[2],
                      lines
                    )
                  end)
                end
              })
            end
          })
        end

        vim.api.nvim_buf_set_keymap(buf, 'n', '<Esc>', '<cmd>close<CR>', {
          noremap = true,
          silent = true
        })
      end)
    end
  })
end

return M
