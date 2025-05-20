return {
	"saghen/blink.cmp",
	dependencies = {
    "rafamadriz/friendly-snippets",
    "saghen/blink.compat",
    "R-nvim/cmp-r",
    "R-nvim/R.nvim"
  },

	version = "*",

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = { preset = "super-tab" },

		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "normal",
		},

		-- default list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, due to `opts_extend`
		sources = {
			default = { "lsp", "path", "snippets", "buffer", "markdown", "r"  },
      providers = {
            markdown = {
                name = 'RenderMarkdown',
                module = 'render-markdown.integ.blink',
                fallbacks = { 'lsp' },
            },

            r = {
                name = "r",
                module = "blink.compat.source"
            },
        },
			-- optionally disable cmdline completions
			-- cmdline = {},
		},

		-- experimental signature help support
		-- signature = { enabled = true }

		completion = {
			-- Show documentation when selecting a completion item
			documentation = { auto_show = true, auto_show_delay_ms = 500 },
		},

	},
  accept = {
        auto_brackets = {
          enabled = true,
        },
      },

	-- allows extending the providers array elsewhere in your config
	-- without having to redefine it
	-- opts_extend = { "sources.default" }<
}

