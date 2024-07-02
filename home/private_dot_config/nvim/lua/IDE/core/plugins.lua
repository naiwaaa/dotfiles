local present, lazy = pcall(require, "lazy")

if not present then
  return
end

lazy.setup("IDE.plugins", {
  defaults = {
    lazy = true,
  },
  install = {
    colorscheme = { require("IDE.theme").colorscheme },
  },
  ui = {
    border = "rounded",
    size = { width = 0.8, height = 0.6 },
    custom_keys = {
      ["<localleader>l"] = false,
      ["<localleader>t"] = false,
    },
  },
  checker = {
    enabled = false,
    notify = false,
    frequency = 24 * 3600,
  },
  change_detection = {
    notify = false,
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "2html_plugin",
        "bugreport",
        "compiler",
        "ftplugin",
        "getscript",
        "getscriptPlugin",
        "gzip",
        "logipat",
        "matchit",
        "matchparen",
        "netrw",
        "netrwFileHandlers",
        "netrwPlugin",
        "netrwSettings",
        "optwin",
        "rplugin",
        "rrhelper",
        "spellfile_plugin",
        "syntax",
        "synmenu",
        "tar",
        "tarPlugin",
        "tohtml",
        "tutor",
        "vimball",
        "vimballPlugin",
        "zip",
        "zipPlugin",
      },
    },
  },
})

local plugins = {

  -- {
  --   "lukas-reineke/indent-blankline.nvim",
  --   config = function()
  --     require("plugins.configs.indent_blankline")
  --   end,
  --   event = require("core.lazy_load").on_file_open_events,
  --   opt = true,
  -- },

  -- {
  --   "ray-x/lsp_signature.nvim",
  --   after = "nvim-lspconfig",
  --   config = function()
  --     require("plugins.configs.lsp_signature")
  --   end,
  -- },

  {
    "editorconfig/editorconfig-vim",
    event = "VeryLazy",
  },

  -- {
  --   "max397574/better-escape.nvim",
  --   config = function()
  --     require("plugins.configs.better_escape")
  --   end,
  --   event = "InsertCharPre",
  -- },

  -- {
  --   "andymass/vim-matchup",
  --   config = function()
  --     require("plugins.configs.matchup")
  --   end,
  --   opt = true,
  --   setup = function()
  --     require("core.utils").lazy_load_plugin("vim-matchup")
  --   end,
  -- },
}
