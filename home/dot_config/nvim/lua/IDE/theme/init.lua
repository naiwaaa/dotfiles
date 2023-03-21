local custom_nord_statusline = function()
  local present, colors = pcall(require, "nord.colors")

  if not present then
    return
  end

  local statusline_theme = require("lualine.themes.nord")

  statusline_theme.normal.c.bg = colors.palette.none

  return statusline_theme
end

return {
  colorscheme = "nord",
  statusline = custom_nord_statusline,
}
