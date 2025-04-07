return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "macchiato", -- oder "latte", "frappe", "macchiato"
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}

