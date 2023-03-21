local present, nvim_tree = pcall(require, "nvim-tree")

if not present then
  return
end

local icons = require("theme.icons")

nvim_tree.setup({
  disable_netrw = true,
  hijack_cursor = true,
  sort_by = "name",
  sync_root_with_cwd = true,
  view = {
    adaptive_size = false,
    side = "right",
    preserve_window_proportions = true,
    mappings = {
      list = {
        { key = "<CR>", action = "edit_in_place" },
        { key = "<C-e>", action = "edit" },
      },
    },
  },
  renderer = {
    group_empty = true,
    highlight_git = true,
    root_folder_modifier = ":~",
    indent_markers = {
      enable = true,
    },
    icons = {
      git_placement = "signcolumn",
      glyphs = {
        git = {
          unstaged = icons.git.unstaged,
          staged = icons.git.staged,
          unmerged = icons.git.unmerged,
          renamed = icons.git.renamed,
          untracked = icons.git.untracked,
          deleted = icons.git.deleted,
          ignored = icons.git.ignored,
        },
      },
    },
  },
  update_focused_file = {
    enable = true,
    update_root = true,
  },
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
})
