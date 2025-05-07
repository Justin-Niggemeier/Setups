return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "macchiato", -- oder "latte", "frappe", "macchiato"
				transparent_background = true,
        floating_border = "on",
				blink_cmp = true,
			})
			vim.cmd.colorscheme("catppuccin")
			--vim.api.nvim_set_hl(0, "Normal", { bg = "none"})
			--vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none"})
		end,
	},
}
