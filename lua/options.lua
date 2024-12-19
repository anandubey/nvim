local indent = 4

-- Clipboard
vim.opt.backspace = { "indent", "eol", "start" }
vim.o.clipboard = "unnamedplus"
vim.o.completeopt = "menu,menuone,noselect"

-- Horizontal/Vertical lines
vim.o.cursorline = true
vim.o.cursorcolumn = false

-- Default encoding
vim.o.encoding = "utf-8"

-- Code folding
vim.o.foldenable = true
vim.o.foldmethod = "manual"

-- Enable background buffers
vim.o.hidden = true

-- Highlight found searches
vim.o.hlsearch = true 
-- Ignore case
vim.o.ignorecase = true
-- Get a preview of replacements
vim.o.inccommand = "split"
-- Shows the match while typing
vim.o.incsearch = true

-- No double spaces with join
vim.o.joinspaces = false 
vim.o.lazyredraw = true

-- Stop words being broken on wrap
vim.o.linebreak = true 
vim.wo.number = true -- Show line numbers
vim.o.relativenumber = true

vim.opt.listchars = { tab = " ", trail = "·", nbsp = "%" }
-- Show some invisible characters
vim.o.list = true
vim.o.shortmess = vim.o.shortmess .. "S" -- stops display of currentsearch match in cmdline area

-- make windows the same width when closing one
vim.o.equalalways = true
-- should get cursorline in number too
vim.o.cursorlineopt = "both"

-- Indentation
vim.o.expandtab = true
vim.o.shiftwidth = indent
vim.o.softtabstop = indent
vim.o.tabstop = indent

vim.o.showmode = false -- Don't display mode
vim.o.scrolloff = 8 -- Lines of context
vim.o.sidescrolloff = 8 -- Columns of context
vim.o.signcolumn = "yes:1" -- always show signcolumns
vim.o.smartcase = true -- Do not ignore case with capitals
vim.opt.spelllang = { "en_us" }

-- Position for splits
vim.o.splitbelow = true
vim.o.splitright = true

-- opt.splitkeep = "screen" -- Stops screen jumping when splits below are opened
vim.o.termguicolors = true -- You will have bad experience for diagnostic messages when it's default 4000.
vim.o.title = true -- Allows neovim to send the Terminal details of the current window, instead of just getting 'v'
--
-- Give me some fenced codeblock goodness
vim.g.markdown_fenced_languages = { "html", "javascript", "typescript", "css", "scss", "lua", "vim" }
vim.o.whichwrap = vim.o.whichwrap .. "<,>" -- Wrap movement between lines in edit mode with arrows
vim.o.wrap = true
vim.o.mouse = "a"
vim.o.guicursor =
  "n-v-c-sm:block-nCursor-blinkwait50-blinkon50-blinkoff50,i-ci-ve:ver25-Cursor-blinkon100-blinkoff100,r-cr-o:hor20"
vim.o.undodir = vim.fn.stdpath("config") .. "/undo"
vim.o.undofile = true
-- vim.notify = require("notify")
vim.o.jumpoptions = "view"
vim.o.timeoutlen = 300 -- The time before a key sequence should complete
vim.opt.cpoptions:append(">") -- when you yank multiple times into a register, this puts each on a new line
vim.opt.nrformats:append("alpha") -- this means you can increment lists that have letters with `g ctrl-a`

vim.o.ph = 15 -- the number is the number of entries to show before scrollbars, not px!
vim.o.cmdheight = 0
vim.o.virtualedit = "block" -- allows using visual blocks beyond the end of a line
vim.g.editorconfig = false -- disable editor config as VSCode does not have it on by default

vim.o.updatetime = 250
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})
