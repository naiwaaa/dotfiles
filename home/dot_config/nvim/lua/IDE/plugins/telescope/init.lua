local cursor_layout = {
  layout_strategy = "cursor",
  layout_config = {
    width = 0.8,
    height = 0.4,
  },
}

return {
  "nvim-telescope/telescope.nvim",
  cmd = { "Telescope" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },
  init = function()
    require("IDE.core.mappings").load_telescope()
  end,
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local create_mappings = require("IDE.plugins.telescope.mappings")

    local opts = {
      defaults = {
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            height = 0.8,
            width = 0.9,
            preview_cutoff = 120,
            preview_width = 0.5,
          },
        },
        default_mappings = create_mappings.default(actions),
        prompt_prefix = "   ",
        initial_mode = "normal",
        path_display = {
          shorten = { len = 2, exclude = { 1, -1, -2 } },
        },
        results_title = false,
        vimgrep_arguments = {
          "rg",
          "--hidden",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--trim",
        },
        set_env = { ["COLORTERM"] = "truecolor" },
      },
      pickers = {
        buffers = {
          mappings = create_mappings.buffer_picker(actions),
        },
        lsp_references = cursor_layout,
        lsp_definitions = cursor_layout,
        lsp_implementations = cursor_layout,
        lsp_type_definitions = cursor_layout,
      },
      extensions = {
        fzf = {},
      },
    }
    telescope.setup(opts)

    local extensions = { "fzf" }
    for _, ext in ipairs(extensions) do
      telescope.load_extension(ext)
    end
  end,
}
