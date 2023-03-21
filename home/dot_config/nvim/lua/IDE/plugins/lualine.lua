local statusline_theme = require("IDE.theme").statusline()

local icons = require("IDE.theme.icons")

local conditions = {
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
}

local custom_components = {
  filetype = {
    "filetype",
    icon_only = true,
    padding = {
      left = 1,
      right = 0,
    },
    separator = "",
  },
}

local function short_mode()
  local mode_map = {
    ["n"] = "N",
    ["no"] = "O-PENDING",
    ["nov"] = "O-PENDING",
    ["noV"] = "O-PENDING",
    ["no\22"] = "O-PENDING",
    ["niI"] = "N",
    ["niR"] = "N",
    ["niV"] = "N",
    ["nt"] = "N",
    ["ntT"] = "N",
    ["v"] = "V",
    ["vs"] = "V",
    ["V"] = "VL",
    ["Vs"] = "VL",
    ["\22"] = "VB",
    ["\22s"] = "VB",
    ["s"] = "S",
    ["S"] = "SL",
    ["\19"] = "SB",
    ["i"] = "I",
    ["ic"] = "I",
    ["ix"] = "I",
    ["R"] = "R",
    ["Rc"] = "R",
    ["Rx"] = "R",
    ["Rv"] = "VR",
    ["Rvc"] = "VR",
    ["Rvx"] = "VR",
    ["c"] = "CMD",
    ["cv"] = "EX",
    ["ce"] = "EX",
    ["r"] = "R",
    ["rm"] = "MORE",
    ["r?"] = "CONFIRM",
    ["!"] = "SHELL",
    ["t"] = "TERM",
  }
  local mode_code = vim.fn.mode()

  if mode_map[mode_code] == nil then
    return mode_code
  end

  return mode_map[mode_code]
end

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = {
    "kyazdani42/nvim-web-devicons",
  },
  opts = {
    options = {
      theme = statusline_theme,
      component_separators = icons.statusline.component_separators,
      section_separators = icons.statusline.section_separators,
      disabled_filetypes = {
        statusline = { "NvimTree" },
        winbar = {},
      },
      globalstatus = false,
    },
    sections = {
      lualine_a = {
        {
          short_mode,
          separator = { left = "" },
          padding = {
            left = 0,
            right = 1,
          },
        },
      },
      lualine_b = {
        custom_components.filetype,
        {
          "filename",
          symbols = {
            modified = icons.filemode.modified,
            readonly = icons.filemode.readonly,
          },
        },
      },
      lualine_c = {
        {
          "branch",
          icon = icons.git.branch,
        },
      },
      lualine_x = {
        "diagnostics",
      },
      lualine_y = {
        {
          "encoding",
          cond = conditions.hide_in_width,
        },
        {
          "fileformat",
          cond = conditions.hide_in_width,
        },
      },
      lualine_z = {
        {
          "location",
          separator = {
            right = "",
          },
          padding = { left = 2, right = 1 },
        },
      },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {
        "filename",
      },
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = { "quickfix" },
  },
  config = function(_, opts)
    require("lualine").setup(opts)
  end,
}
