return {
  "jose-elias-alvarez/null-ls.nvim",
  event = "VeryLazy",
  dependencies = {
    "williamboman/mason.nvim",
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      border = "rounded",
      sources = {
        -- code actions
        null_ls.builtins.code_actions.eslint_d.with({
          env = {
            ESLINT_D_LOCAL_ESLINT_ONLY = 1,
          },
        }),
        null_ls.builtins.code_actions.shellcheck,
        -- diagnostics
        null_ls.builtins.diagnostics.actionlint,
        null_ls.builtins.diagnostics.editorconfig_checker,
        null_ls.builtins.diagnostics.eslint_d.with({
          env = {
            ESLINT_D_LOCAL_ESLINT_ONLY = 1,
          },
        }),
        null_ls.builtins.diagnostics.hadolint,
        null_ls.builtins.diagnostics.jsonlint,
        null_ls.builtins.diagnostics.markdownlint,
        null_ls.builtins.diagnostics.shellcheck,
        null_ls.builtins.diagnostics.tsc,
        -- formattings
        null_ls.builtins.formatting.eslint_d.with({
          env = {
            ESLINT_D_LOCAL_ESLINT_ONLY = 1,
          },
        }),
        null_ls.builtins.formatting.markdownlint,

        null_ls.builtins.formatting.prettierd.with({
          env = {
            PRETTIERD_LOCAL_PRETTIER_ONLY = 1,
          },
        }),
        null_ls.builtins.formatting.shfmt,
        null_ls.builtins.formatting.stylua,
      },
    })
  end,
}
