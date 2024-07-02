local g = vim.g
local opt = vim.opt

-- visually indent every wrapped line
opt.breakindent = true

-- use system clipboard
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"

-- highlight column after |textwidth|
opt.colorcolumn = "+1"

-- use popup menu to show completions
opt.completeopt = { "menu", "menuone", "noselect" }

-- hide * markup for bold and italic, but not markers with substitutions
opt.conceallevel = 2

-- highlight the screen line of the cursor
opt.cursorline = true

-- use spaces when <Tab> is inserted
opt.expandtab = true

-- set utf8 as standard encoding
--opt.fileencoding = "utf-8"
opt.fileencodings = "ucs-bom,utf-8,sjis,default,latin1"

-- use custom characters for displaying special items
opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  eob = " ",
}

-- do not fold when opening a file
opt.foldenable = false

-- fold based on syntax
opt.foldmethod = "syntax"

-- set maximum fold depth
opt.foldnestmax = 2

-- do not automatically wrap text on typing
opt.formatoptions = "jcroqlnt"

-- format to recognize `grep` command output
opt.grepformat = "%f:%l:%c:%m"

-- define `grep` command
opt.grepprg = "rg --vimgrep"

-- ignore case in search patterns
opt.ignorecase = true

-- show global status line
opt.laststatus = 3

-- do not redraw while executing macros
opt.lazyredraw = true

-- break line at |breatat| characters
opt.linebreak = true

-- display tabs and trailing spaces visually in list mode
opt.listchars = {
  eol = "↲",
  extends = "»",
  lead = "·",
  nbsp = "␣",
  precedes = "«",
  tab = "▸-",
  trail = "·",
}

-- set characters that form pairs
opt.matchpairs = { "(:)", "{:}", "[:]", "<:>" }

-- enable mouse support
opt.mouse = "a"

-- make the mouse work like with Windows
opt.mousemodel = "popup"

-- show line number
opt.number = true

-- set minimal number of columns used for the line number
opt.numberwidth = 2

-- enable pseudo-transparency for popup
opt.pumblend = 10

-- maxium number of items in popup
opt.pumheight = 10

-- reduce time for redrawing the display
opt.redrawtime = 1500

-- show relative line number
opt.relativenumber = true

-- do not cursor position
opt.ruler = false

-- keep a number of lines above and below the cursor
opt.scrolloff = 10

-- round indent to multiple of `shiftwidth`
opt.shiftround = true

-- number of spaces to use for each indent step
opt.shiftwidth = 2

-- shorten many interruptive prompts
opt.shortmess = "atI"

-- put a string at the start of wrapped lines
opt.showbreak = "↪ "

-- do not show current mode
opt.showmode = false

-- keep a number of columns to left and right of the cursor if |nowrap|
opt.sidescrolloff = 8

-- display signs in the line number column
opt.signcolumn = "yes"

-- override |ignorecase| when search pattern has uppercase
opt.smartcase = true

-- smart autoindenting
opt.smartindent = true

-- smooth scroll
opt.smoothscroll = true

-- number of spaces that <Tab> uses while editing
opt.softtabstop = 2

-- split to bottom
opt.splitbelow = true

-- split to the right
opt.splitright = true

-- disable swapfile
opt.swapfile = false

-- number of visual spaces per tab
opt.tabstop = 2

-- enable true color support
opt.termguicolors = true

-- maximum width of text that is being inserted
opt.textwidth = 90

-- reduce time to wait for a mapped sequence to complete
opt.timeoutlen = 300

-- reduce time to wait for a key code sequence to complete
opt.ttimeoutlen = 10

-- save undo information in a file
opt.undofile = true

-- reduce time to wait for flushing swap file
opt.updatetime = 200

-- command-line completion mode
opt.wildmode = "longest:full,full"

-- ignore the following file patternss when expanding |wildcards|
opt.wildignore = {
  -- binary files
  "*.o",
  "*.obj",
  "*~",
  "*.so",
  "*.swp",
  "*.zip",
  "*.png",
  "*.jpg",
  "*.gif",
  -- Git
  "*/.git/*",
  -- Node.js
  "*/node_modules/*",
  -- Python
  "*.pyc",
  "*/.venv/*",
  "*/__pycache__/*",
}

-- minimum window width
opt.winminwidth = 5

-- turn off wrap
opt.wrap = false

-- turn off backup
opt.writebackup = false

-- disable providers
local default_providers = {
  "node",
  "perl",
  "python3",
  "ruby",
}

for _, provider in ipairs(default_providers) do
  g["loaded_" .. provider .. "_provider"] = 0
end
