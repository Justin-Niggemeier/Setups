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
  checker = { enabled = true },  -- Überprüfe automatisch auf Plugin-Updates
})
-----------------------------------------------------------
-- Auto-Update Plugins alle 7 Tage (Lazy.nvim)
-----------------------------------------------------------
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local update_interval_days = 7
    local stampfile = vim.fn.stdpath("data") .. "/lazy_last_update.txt"

    -- Lese letzten Update-Timestamp
    local function read_last()
      local f = io.open(stampfile, "r")
      if f then
        local t = tonumber(f:read("*a"))
        f:close()
        return t
      end
    end

    -- Schreibe aktuellen Timestamp
    local function write_now()
      local f = io.open(stampfile, "w")
      if f then
        f:write(os.time())
        f:close()
      end
    end

    local last = read_last()
    if not last or (os.time() - last) > (update_interval_days * 86400) then
      -- Kurzzeitig alle Notifications unterdrücken (z.B. "Neue Updates verfügbar")
      local orig_notify = vim.notify
      vim.notify = function() end

      require("lazy").sync()

      -- Ursprüngliche notify-Funktion wiederherstellen
      vim.notify = orig_notify

      write_now()
    end
  end,
})

-----------------------------------------------------------
-- Unterdrücke die „Neue Updates verfügbar“-Benachrichtigung
-----------------------------------------------------------
-- Daran musst du nichts ändern: es ergänzt lediglich deinen bestehenden checker-Eintrag
require("lazy").setup({
  checker = {
    enabled = true,
    notify  = false,  -- keine Popup-Nachricht, wenn Updates gefunden werden
  },
})

