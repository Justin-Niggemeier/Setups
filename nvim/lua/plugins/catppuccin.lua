return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		config = function()
			require("catppuccin").setup({
				flavour = "macchiato", -- oder "latte", "frappe", "macchiato"
				transparent_background = true,
        integrations = {
        },
        floating_border = "on",
				blink_cmp = true,
			})
			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
