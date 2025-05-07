return {
  {
    "mbbill/undotree",
    keys = {
      {"<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Undotree toggle"}
    },
    config = function()
      vim.g.undotree_SetFocusWhenToggle = 1  -- Fokus auf Undotree beim Öffnen
      vim.g.undotree_SplitWidth = 40         -- Breite des Undotree-Fensters

      -- Automatisches Schließen bei Dateiwechsel
      vim.api.nvim_create_autocmd("BufEnter", {
        callback = function()
          if vim.bo.filetype == "undotree" then
            vim.cmd("quit")
          end
        end
      })
    end
  },
}
