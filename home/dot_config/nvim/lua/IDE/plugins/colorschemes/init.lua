local colorscheme = require("IDE.theme").colorscheme
local plugin = require("IDE.plugins.colorschemes." .. colorscheme)

return {
  plugin,
}
