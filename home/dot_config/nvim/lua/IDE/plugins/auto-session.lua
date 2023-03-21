return {
  "rmagatti/auto-session",
  lazy = false,
  init = function()
    require("IDE.core.mappings").load_auto_session()
  end,
  opts = {
    auto_save_enabled = true,
    auto_restore_enabled = true,
    auto_session_suppress_dirs = { "/*", "~/*" },
    auto_session_allowed_dirs = { "~/Projects/*" },
    pre_save_cmds = { "NvimTreeClose", "cclose" },
    cwd_change_handling = {
      restore_upcoming_session = false,
    },
  },
  config = function(_, opts)
    require("auto-session").setup(opts)
  end,
}
