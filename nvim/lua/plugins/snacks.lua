return
{
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = {
        enabled = true,
        notify = true, -- show notification when big file detected
        size = 0.75 * 1024 * 1024, -- 0.75MB
        line_length = 1200, -- average line length (useful for minified files)
      },
    dashboard = { enabled = true },
    explorer = { enabled = false },
      indent = {
        enabled = true,
        animate = {
          enabled = vim.fn.has("nvim-0.10") == 1,
          style = "out",
          easing = "linear",
          duration = {
            step = 10, -- ms per step
            total = 500, -- maximum duration
          },
        },
      },
    input = { enabled = false };
    picker = { enabled = false },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = {enabled = true},
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
}
