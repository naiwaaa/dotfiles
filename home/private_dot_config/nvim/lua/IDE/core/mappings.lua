local M = {}

local function map(mode, keys, command, opts)
  options = vim.tbl_extend("force", { remap = false, silent = true }, opts or {})
  vim.keymap.set(mode, keys, command, options)
end

-- map leader to ,
vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

-- quickly switch to CMD mode
map("n", ";", ":", { silent = false })
map("n", ":", ";", { silent = false })

-- quickly run shell command
map("n", "!", ":!")

-- quickly turn off search highlighting
map("n", "<Esc>", "<Cmd>nohlsearch<CR>")

------------------------------------------------------------
-- editting
------------------------------------------------------------

-- indent code blocks
map("v", "<", "<gv")
map("v", ">", ">gv")

-- auto indent pasted text
--map("n", "p", "p=`]<C-o>")
--map("n", "P", "P=`]<C-o>")

-- saner behavior of n and N
map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

-- move lines up/down
map("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
map("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { desc = "Move line down" })
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { desc = "Move line up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move line down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move line up" })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

------------------------------------------------------------
-- line navigation
------------------------------------------------------------

-- move the cursor through wrapped lines
-- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
-- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
map({ "n", "v" }, "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
map({ "n", "v" }, "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })

-- prevent multiple h/l
map({ "n", "v" }, "L", "l")
map({ "n", "v" }, "H", "h")
map({ "n", "v" }, "l", "w")
map({ "n", "v" }, "h", "b")

-- move to beginning/end of line
map({ "n", "v" }, "B", "^")
map({ "n", "v" }, "E", "$")

-- line navigation in insert mode
map("i", "<C-j>", "<Down>")
map("i", "<C-k>", "<Up>")
map("i", "<C-l>", "<Right>")
map("i", "<C-h>", "<Left>")
map("i", "<C-b>", "<Esc>^i")
map("i", "<C-e>", "<End>")

------------------------------------------------------------
-- windows navigation
------------------------------------------------------------

-- split windows
map("n", "<leader>w-", "<C-W>s", { desc = "Split Window Below", remap = true })
map("n", "<leader>w|", "<C-W>v", { desc = "Split Window Right", remap = true })

-- navigate between windows easily
map("n", "<Leader>j", "<C-w>j", { desc = "Focus below window" })
map("n", "<Leader>k", "<C-w>k", { desc = "Focus above window" })
map("n", "<Leader>l", "<C-w>l", { desc = "Focus right window" })
map("n", "<Leader>h", "<C-w>h", { desc = "Focus left window" })

-- resize window
map("n", "<C-Up>", "<Cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<Cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<Cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<Cmd>vertical resize +2<cr>", { desc = "Increase window width" })

------------------------------------------------------------
-- tab page navigation
------------------------------------------------------------

-- navigate between tabpages
map("n", "]t", "<Cmd>tabnext<CR>", { desc = "Open next tab" })
map("n", "[t", "<Cmd>tabprev<CR>", { desc = "Open previous tab" })

map("n", "<Leader>1", "<Cmd>tabfirst<CR>", { desc = "Open the first tab" })
map("n", "<Leader>2", "2gt", { desc = "Open 2nd tab" })
map("n", "<Leader>3", "3gt", { desc = "Open 3rd tab" })
map("n", "<Leader>0", "<Cmd>tablast<CR>", { desc = "Open the last tab" })

------------------------------------------------------------
-- location & quickfix list
------------------------------------------------------------

map("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })
map("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix List" })
map("n", "[q", vim.cmd.cprev, { desc = "Previous Quickfix" })
map("n", "]q", vim.cmd.cnext, { desc = "Next Quickfix" })

------------------------------------------------------------
-- external commands
------------------------------------------------------------

-- run previous shell command
map("n", "<F11>", ":!!<CR>")

------------------------------------------------------------
-- plugins
------------------------------------------------------------

M.load_auto_session = function()
  map("n", "<Leader>sl", ":silent RestoreSession<CR>", { desc = "Restore saved session" })
  map("n", "<Leader>ss", ":SaveSession<CR>", { desc = "Save session" })
  map("n", "<Leader>sd", ":DeleteSession<CR>", { desc = "Delete session" })
end

M.load_lspconfig = function(bufnr)
  local opts = { buffer = bufnr }

  -- jump
  map("n", "gD", vim.lsp.buf.declaration, opts)
  -- map("n", "gd", vim.lsp.buf.definition, opts)
  -- map("n", "gi", vim.lsp.buf.implementation, opts)
  -- map("n", "gr", vim.lsp.buf.references, opts)
  -- map("n", "gt", vim.lsp.buf.type_definition, opts)

  -- display info
  map("n", "<Enter>", vim.lsp.buf.hover, opts)
  map("n", "<C-Space>", vim.lsp.buf.signature_help, opts)

  -- diagnostics
  map("n", "[d", vim.diagnostic.goto_prev, opts)
  map("n", "]d", vim.diagnostic.goto_next, opts)
  map("n", "<Leader>e", vim.diagnostic.open_float, opts)
  map("n", "<Leader>q", vim.diagnostic.setloclist, opts)

  -- others
  map("n", "<Leader>rn", vim.lsp.buf.rename, opts)
  map("n", "<Leader>ca", vim.lsp.buf.code_action, opts)
  map("n", "<Leader>s", function()
    vim.lsp.buf.formatting({ async = true })
  end, opts)

  -- telescope
  map("n", "gd", ":Telescope lsp_definitions<CR>", { desc = "Go to definition" })
  map("n", "gi", ":Telescope lsp_implementations<CR>", { desc = "Go to implementation" })
  map("n", "gr", "<cmd>Telescope lsp_references<cr>", { desc = "Go to reference" })
  map(
    "n",
    "gt",
    ":Telescope lsp_type_definitions<CR>",
    { desc = "Go to type definition" }
  )

  -- map(
  --   "n",
  --   "<leader>ldb",
  --   "<cmd>Telescope diagnostics bufnr=0<cr>",
  --   { desc = "Show buffer diagnostics" }
  -- )
  -- map(
  --   "n",
  --   "<leader>ldw",
  --   "<cmd>Telescope diagnostics<cr>",
  --   { desc = "Workspace diagnostics" }
  -- )
  --
end

M.load_nvim_tree = function()
  map("n", "<Leader>e", "<cmd>NvimTreeToggle<CR>")
  map("n", "<Leader>t", function()
    local view = require("nvim-tree.view")
    if view.is_visible() then
      view.close()
      return
    end

    local previous_buf = vim.api.nvim_get_current_buf()
    require("nvim-tree").open_replacing_current_buffer()
    require("nvim-tree").find_file(false, previous_buf)

    vim.cmd("setlocal nowinfixwidth")
    vim.cmd("setlocal nowinfixheight")
  end)
end

M.load_telescope = function()
  map("n", "<Leader>ff", ":Telescope find_files <CR>", { desc = "Find file" })
  map("n", "<Leader>fw", ":Telescope grep_string <CR>", { desc = "Search current word" })
  map("n", "<Leader>fs", ":Telescope live_grep <CR>", { desc = "Search string" })

  map("n", "<Leader>fb", ":Telescope buffers <CR>", { desc = "Find buffer" })

  map("n", "<Leader>vc", ":Telescope git_commits <CR>", { desc = "Git commits" })
  map("n", "<Leader>vs", ":Telescope git_status <CR>", { desc = "Git status" })
end

return M
