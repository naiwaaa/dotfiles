local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0
    and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s")
      == nil
end

return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lua",
    "saadparwaiz1/cmp_luasnip",
    "L3MON4D3/LuaSnip",
  },
  event = "InsertEnter",
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    cmp.setup({
      enabled = function()
        if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
          return false
        end

        if vim.fn.reg_recording() ~= "" or vim.fn.reg_executing() ~= "" then
          return false
        end

        -- disable completion in comments
        local context = require("cmp.config.context")
        if vim.api.nvim_get_mode().mode == "c" then
          -- keep command mode completion enabled when cursor is in a comment
          return true
        else
          return not context.in_treesitter_capture("comment")
            and not context.in_syntax_group("Comment")
        end
      end,
      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
          local lspkind_icons = require("IDE.theme.icons").lspkinds

          vim_item.kind = string.format("%s", lspkind_icons[vim_item.kind])
          vim_item.menu = ({
            buffer = "「BUF」",
            nvim_lsp = "「LSP」",
            luasnip = "「SNIP」",
            nvim_lua = "「LUA」",
          })[entry.source.name]

          return vim_item
        end,
      },
      matching = {
        disallow_partial_fuzzy_matching = false,
      },
      window = {
        completion = {
          border = "single",
          winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
        },
        documentation = {
          border = "single",
          winhighlight = "FloatBorder:FloatBorder",
        },
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-n>"] = nil,
        ["<C-p>"] = nil,
        ["<C-y>"] = nil,
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
        { name = "nvim_lua" },
        { name = "luasnip" },
      }),
      experimental = {
        ghost_text = true,
      },
    })

    -- set configuration for specific filetype.
    cmp.setup.filetype("gitcommit", {
      sources = cmp.config.sources({
        { name = "cmp_git" },
      }, {
        { name = "buffer" },
      }),
    })

    -- use buffer source for `/` and `?`
    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })

    -- use cmdline & path source for ':'
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        { name = "cmdline" },
      }),
    })

    -- set up autopairs
    cmp.event:on(
      "confirm_done",
      require("nvim-autopairs.completion.cmp").on_confirm_done()
    )
  end,
}
