return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  opts = {
    disable_filetype = { "TelescopePrompt", "vim" },
    disable_in_macro = true,
    check_ts = true,
    ts_config = {
      lua = { "string", "source" },
      javascript = { "string", "template_string" },
      java = false,
    },
    fast_wrap = {},
  },
  config = function(_, opts)
    require("nvim-autopairs").setup(opts)
  end,
}
