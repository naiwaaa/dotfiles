return {
  "L3MON4D3/LuaSnip",
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  opts = {
    history = true,
    updateevents = "TextChanged,TextChangedI",
  },
  config = function(_, opts)
    local luasnip = require("luasnip")

    luasnip.config.set_config(opts)

    -- extend html snippets to react files
    luasnip.filetype_extend("javascriptreact", { "html" })
    luasnip.filetype_extend("typescriptreact", { "html" })

    -- load snippets (friendly-snippets)
    require("luasnip.loaders.from_vscode").lazy_load()
  end,
}
