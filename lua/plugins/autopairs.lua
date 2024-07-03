-- Autopairs matches the closing brackets for pairs like that.
-- nvim-ts-autotag is got generating the closing html tag automatically

return {
	{
		"windwp/nvim-autopairs",

		dependencies = { "hrsh7th/nvim-cmp" },
		config = function()
			require("nvim-autopairs").setup({})
			-- If you want to automatically add `(` after selecting a function or method
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp = require("cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

			-- put this to setup function and press <a-e> to use fast_wrap
			local Rule = require("nvim-autopairs.rule")
			local npairs = require("nvim-autopairs")
			npairs.setup({
				fast_wrap = {},
			})
		end,
	},

	{
		"windwp/nvim-ts-autotag",

		config = function()
			require("nvim-ts-autotag").setup({
				opts = {
					-- Defaults
					enable_close = true, -- Auto close tags
					enable_rename = true, -- Auto rename pairs of tags
					enable_close_on_slash = false, -- Auto close on trailing </
				},
				-- Also override individual filetype configs, these take priority.
				-- Empty by default, useful if one of the "opts" global settings
				-- doesn't work well in a specific filetype
				per_filetype = {
					["html"] = {
						enable_close = false,
					},
				},
			})
		end,
	},
}
