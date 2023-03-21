return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  opts = {
    ensure_installed = {
      "bashls",
      "cssls",
      "dockerls",
      "docker_compose_language_service",
      "graphql",
      "html",
      "jsonls",
      "lua_ls",
      "pyright",
      "rust_analyzer",
      "taplo",
      "tsserver",
      "yamlls",
    },
  },
  config = function(_, opts)
    require("mason-lspconfig").setup({
      ensure_installed = opts.ensure_installed,
    })

    local lspconfig = require("lspconfig")
    local default_options = require("IDE.lsp.servers.default")

    local start_server = function(server)
      if server == "null_ls" then
        return
      end

      local present, server_options = pcall(require, "IDE.lsp.servers." .. server)
      server_options = present
          and vim.tbl_deep_extend("force", default_options, server_options)
        or default_options

      lspconfig[server].setup(server_options)
    end

    for _, server in ipairs(opts.ensure_installed) do
      start_server(server)
    end
  end,
}
