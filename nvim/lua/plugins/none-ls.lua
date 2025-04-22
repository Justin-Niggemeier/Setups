return {
  "nvimtools/none-ls.nvim",
  event = "InsertEnter",
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier.with({
          filetypes = { "javascript", "typescript", "css", "html", "json", "yaml", "markdown" },
        }),
        null_ls.builtins.formatting.black, -- Python
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.clang_format, -- C/C++/Java
      },
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
