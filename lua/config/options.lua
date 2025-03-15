-- Set <space> as the leader key
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Convert tabs to spaces
vim.opt.expandtab = true
-- Number of spaces to indent with >> or <<
vim.opt.shiftwidth = 4
-- Number of spaces shown per tab
vim.opt.tabstop = 4
-- Number of spaces applied upon pressing tab
vim.opt.softtabstop = 4

vim.opt.smarttab = true
vim.opt.smartindent = true
-- Keep indentation from previous line
vim.opt.autoindent = true

-- Enable break indent
vim.opt.breakindent = true

-- Make line numbers default
vim.opt.number = true
-- Enable relative line number
vim.opt.relativenumber = true

-- Show line under the cursor
vim.opt.cursorline = true

-- Store undofiles between sessions
vim.opt.undofile = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn(left of line numbers) on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Disable cmdline until it's needed
-- vim.opt.cmdheight = 0


