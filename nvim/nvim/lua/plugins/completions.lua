return {
	"saghen/blink.cmp",
	event = "InsertEnter",
	dependencies = { "rafamadriz/friendly-snippets"},

	version = "1.*",
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		appearance = {
			nerd_font_variant = "mono",
		},
		completion = {
			documentation = {
				auto_show = true,
        window = {
          border = "rounded",
        }
			},
			menu = {
				border = "rounded",
			},
			ghost_text = {
				enabled = true,
			},
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},

		keymap = {
			["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-e>"] = { "hide", "fallback" },

			["<Tab>"] = { "accept", "fallback" },
			["<CR>"] = { "accept", "fallback" },

			["<Up>"] = { "select_prev", "fallback" },
			["<Down>"] = { "select_next", "fallback" },

			["<C-p>"] = { "select_prev", "fallback_to_mappings" },
			["<C-b>"] = { "scroll_documentation_up", "fallback" },
		},

		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	opts_extend = { "sources.default" },
}
