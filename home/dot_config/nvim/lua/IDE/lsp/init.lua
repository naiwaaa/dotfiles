-- customize how diagnostics are displayed
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  float = {
    source = "always",
    border = "rounded",
  },
})

-- replace the default lsp diagnostic symbols
local diagnostic_icons = require("IDE.theme.icons").diagnostics
local signs = {
  Error = diagnostic_icons.error,
  Warn = diagnostic_icons.warn,
  Info = diagnostic_icons.info,
  Hint = diagnostic_icons.hint,
}

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
