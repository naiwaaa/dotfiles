return {
  "gbprod/nord.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    transparent = true,
    errors = { mode = "fg" },
  },
  config = function(_, opts)
    require("nord").setup(opts)

    vim.cmd("colorscheme nord")
  end,
}
