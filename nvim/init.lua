-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setting up vim Diagnostics
vim.diagnostic.config({
  virtual_text = {
    prefix = '',  -- Hier kannst du ein passendes Symbol wählen (z. B. ein Pfeil oder Warnzeichen)
    spacing = 2,    -- Abstand zwischen dem Code und der angezeigten Fehlermeldung
    format = function(diagnostic)
      return diagnostic.message  -- Hier wird der komplette Meldungstext ausgegeben (du kannst ihn bei Bedarf auch kürzen)
    end,
  },
  signs = true,      -- Behalte die Zeichen in der Sign-Spalte bei
  underline = true,  -- Unterstreiche problematische Stellen
})

-- Virtueller Text (z. B. rechts im Code): kein Hintergrund
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = "#ed8796", bg = "none" })
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn",  { fg = "#eed49f", bg = "none" })
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo",  { fg = "#ee99a0", bg = "none" })
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint",  { fg = "#f5bde6", bg = "none" })
  end
})

-- Loading of standard vim settings
require("custom.options")

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
