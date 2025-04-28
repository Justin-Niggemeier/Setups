return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    dependencies = {
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
    },
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require("lspconfig")
      -- gleiche Struktur, um neue LSP's hinzuzufügen
      lspconfig.basedpyright.setup({
         settings = {
          basedpyright = {
            analysis = {
              typeCheckingMode = "basic",
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
              diagnosticMode = "workspace",
              venvPath = "/home/mm406063/Software",  -- Pfad zu deinen Venv-Ordnern
              venv = "venv_ceptr",  -- Name des Venv-Ordners
            },
            python = {
              diagnosticMode = "workspace",
              pythonPath = "/home/mm406063/Software/venv_ceptr/bin/python",
              venvPath = "/home/mm406063/Software",  -- Pfad zu deinen Venv-Ordnern
              venv = "venv_ceptr",  -- Name des Venv-Ordners
            }
          }
        },
        capabilities = capabilities
      })

      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })
      lspconfig.clangd.setup({
        -- cmd = {"/usr/bin/clang"},
        capabilities = capabilities
      })
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, {})
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
    end
  },
}
