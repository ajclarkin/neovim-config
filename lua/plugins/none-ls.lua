return {
    -- Use mason-null-ls to make sure that the sources for none_ls are installed.
    -- Otherwise each one has to be installed by doing :Mason then finding it and
    -- hitting I
    {
        "jay-babu/mason-null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "nvimtools/none-ls.nvim",
        },
        config = function()
            require("mason-null-ls").setup({
                ensure_installed = {
                    -- Opt to list sources here, when available in mason.
                },
                automatic_installation = true,
                handlers = {},
            })
        end,
    },

    {
        "nvimtools/none-ls.nvim",
        config = function()
            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    -- Lua
                    null_ls.builtins.formatting.stylua,
                    -- Python
                    null_ls.builtins.formatting.ruff,
                    null_ls.builtins.formatting.black,
                    null_ls.builtins.formatting.isort,
                },
            })

            vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
        end,
    },
}
