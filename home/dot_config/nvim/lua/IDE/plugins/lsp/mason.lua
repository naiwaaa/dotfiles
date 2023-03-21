local progress_icons = require("IDE.theme.icons").progress

return {
  "williamboman/mason.nvim",
  cmd = {
    "Mason",
    "MasonInstall",
    "MasonUninstall",
    "MasonUninstallAll",
    "MasonLog",
  },
  opts = {
    max_concurrent_installers = 10,
    ui = {
      border = "rounded",
      width = 0.8,
      height = 0.6,
      icons = {
        package_pending = progress_icons.working,
        package_installed = progress_icons.success,
        package_uninstalled = progress_icons.cancel,
      },
    },
    ensure_installed = {
      -- linters
      "editorconfig-checker",
      "eslint_d",
      "hadolint",
      "jsonlint",
      "markdownlint",
      "shellcheck",
      -- formatters
      "prettierd",
      "shfmt",
      "stylua",
    },
  },
  config = function(_, opts)
    require("mason").setup(opts)

    local registry = require("mason-registry")
    for _, tool in ipairs(opts.ensure_installed) do
      local p = registry.get_package(tool)
      if not p:is_installed() then
        p:install()
      end
    end
  end,
}
