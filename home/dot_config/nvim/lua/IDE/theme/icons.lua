local M = {}

M.diagnostics = {
  error = " ",
  hint = " ",
  info = " ",
  warn = " ",
}

M.filemode = {
  modified = " ",
  readonly = " ",
}

M.git = {
  branch = "",
  diff = {
    added = "",
    changed = "",
    copied = "",
    deleted = "",
    renamed = "",
    unmerged = "",
    untracked = "",
  },
  unstaged = "",
  staged = "",
  unmerged = "",
  renamed = "➡",
  untracked = "",
  deleted = "",
  ignored = "◌",
}

M.lspkinds = {
  Array = " ",
  Boolean = " ",
  Class = " ",
  Color = " ",
  Constant = " ",
  Constructor = " ",
  Copilot = " ",
  Enum = " ",
  EnumMember = " ",
  Event = " ",
  Field = " ",
  File = " ",
  Folder = " ",
  Function = " ",
  Interface = " ",
  Key = " ",
  Keyword = " ",
  Method = " ",
  Module = " ",
  Namespace = " ",
  Null = "ﳠ ",
  Number = " ",
  Object = " ",
  Operator = " ",
  Package = " ",
  Property = " ",
  Reference = " ",
  Snippet = " ",
  String = " ",
  Struct = " ",
  Text = " ",
  TypeParameter = " ",
  Unit = " ",
  Value = " ",
  Variable = " ",
}

M.progress = {
  success = " ",
  working = " ",
  cancel = " ",
}

M.statusline = {
  component_separators = { left = "|", right = "|" },
  section_separators = { left = "", right = "" },
}

return M
