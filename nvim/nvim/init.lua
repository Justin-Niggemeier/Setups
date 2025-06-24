-----------------------------------------------------------
-- Bootstrap Lazy.nvim
-----------------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_err_writeln("Failed to clone lazy.nvim:\n" .. out)
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-----------------------------------------------------------
-- Global Diagnostics & Highlight Setup
-----------------------------------------------------------
-- Speeds up things somehow
vim.loader.enable()

vim.diagnostic.config({
  virtual_text = {
    prefix = '',  -- Symbol für virtuelle Fehlermeldungen (anpassbar)
    spacing = 2,    -- Abstand zwischen Code und Fehlermeldung
    format = function(diagnostic)
      return diagnostic.message  -- Ausgabe der kompletten Fehlermeldung
    end,
  },
  signs = true,
  underline = true,
})

-- Hilfsfunktion zum Setzen von Highlights ohne Hintergrund
local function set_no_bg(highlight_group, fg)
 vim.api.nvim_set_hl(0, highlight_group, { fg = fg, bg = "none" })
end

-- habe alle Farben für Catpuccin Macciato gefunden und gesetzt
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    set_no_bg("DiagnosticVirtualTextError", "#ed8796")
    set_no_bg("DiagnosticVirtualTextWarn",  "#eed49f")
    set_no_bg("DiagnosticVirtualTextInfo",  "#ee99a0")
    set_no_bg("DiagnosticVirtualTextHint",  "#f5bde6")
  end,
})

-----------------------------------------------------------
-- Standard Vim Optionen laden
-----------------------------------------------------------
require("custom.options")

-----------------------------------------------------------
-- Lazy.nvim Setup
-----------------------------------------------------------
require("lazy").setup({
  spec = {
    -- Importiere alle Plugins aus dem "plugins"-Verzeichnis
    { import = "plugins" },
  },
  checker = { enabled = false },  -- Überprüfe automatisch auf Plugin-Updates
})

