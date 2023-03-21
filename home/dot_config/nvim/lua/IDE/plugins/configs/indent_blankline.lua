local present, indent_blankline = pcall(require, "indent_blankline")

if not present then
  return
end

indent_blankline.setup({
  char = "┊",
  context_char = "│",
  buftype_exclude = { "terminal" },
  filetype_exclude = {
    "help",
    "terminal",
    "lspinfo",
    "mason",
    "NvimTree",
    "packer",
    "TelescopePrompt",
    "TelescopeResults",
    "",
  },
  show_current_context = true,
  show_current_context_start = true,
  show_trailing_blankline_indent = false,
})
