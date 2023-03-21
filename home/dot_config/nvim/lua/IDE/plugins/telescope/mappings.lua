local M = {}

M.default = function(actions)
  return {
    i = {
      ["<C-n>"] = actions.move_selection_next,
      ["<C-p>"] = actions.move_selection_previous,
      --
      ["<C-c>"] = actions.close,
      --
      ["<CR>"] = actions.select_default,
      ["<C-s>"] = actions.select_horizontal,
      ["<C-v>"] = actions.select_vertical,
      ["<C-t>"] = actions.select_tab,
      --
      ["<C-u>"] = actions.preview_scrolling_up,
      ["<C-d>"] = actions.preview_scrolling_down,
      --
      ["<Tab>"] = actions.toggle_selection + actions.move_selection_next,
      ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_previous,
      -- disable c-j because we dont want to allow new lines #2123
      ["<C-j>"] = actions.nop,
    },
    n = {
      ["j"] = actions.move_selection_next,
      ["k"] = actions.move_selection_previous,
      ["gg"] = actions.move_to_top,
      ["M"] = actions.move_to_middle,
      ["G"] = actions.move_to_bottom,
      --
      ["<Esc>"] = actions.close,
      ["q"] = actions.close,
      --
      ["<CR>"] = actions.select_default,
      ["s"] = actions.select_horizontal,
      ["v"] = actions.select_vertical,
      ["<C-t>"] = actions.select_tab,
      --
      ["<C-u>"] = actions.preview_scrolling_up,
      ["<C-d>"] = actions.preview_scrolling_down,
      --
      ["<Tab>"] = actions.toggle_selection + actions.move_selection_next,
      ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_previous,
    },
  }
end

M.buffer_picker = function(actions)
  return {
    n = {
      ["d"] = actions.delete_buffer,
    },
  }
end

return M
