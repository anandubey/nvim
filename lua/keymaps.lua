local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<leader>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",



---------------------- Normal -------------------------

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-S-k>", "<cmd>resize -2<CR>", opts)
keymap("n", "<C-S-j>", "<cmd>resize +2<CR>", opts)
keymap("n", "<C-S-h>", "<cmd>vertical resize -2<CR>", opts)
keymap("n", "<C-S-l>", "<cmd>vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<S-h>", ":BufferLineCyclePrev<CR>", opts)

-- Close buffers
keymap("n", "<S-q>", "<cmd>:BDelete! this<CR>", opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Quit neovim
keymap("n", "<leader>qn", ":qa!<CR>", opts)

-- Buffer spliting
keymap("n", "<leader>sl", "<cmd>vsplit<cr>", opts)
keymap("n", "<leader>sj", "<cmd>split<cr>", opts)

-- Zen mode
keymap("n", "<leader>zm", "<cmd>TZMinimalist<cr>", opts)
keymap("n", "<leader>zk", "<cmd>TZAtaraxis<cr>", opts)

-- Reload current file
keymap("n", "<leader>rn", ":so %<CR>", opts)

-- Searches the link under cusros in web browser
keymap("n", "<leader>gx", [[:silent execute '!$BROWSER ' . shellescape(expand('<cfile>'), 1)<CR>]], opts)




----------------- Insert ----------------------------

-- Press jk/JK or kj/KJ fast to enter
keymap("i", "jk", "<ESC>", opts)
keymap("i", "JK", "<ESC>", opts)




----------------- Command ----------------------------

keymap("c", "jk", "<ESC>", { silent = true })
keymap("c", "JK", "<ESC>", { silent = true })




------------------ Visual ----------------------------

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)


keymap("v", "jk", "<ESC>", opts)
keymap("v", "JK", "<ESC>", opts)


------------------ Visual Block ----------------------

-- Move line up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

keymap("x", "jk", "<ESC>", opts)
keymap("x", "JK", "<ESC>", opts)



------------------ Plugins ----------------------------

-- NeoTree
keymap("n", "<C-n>", ":Neotree toggle reveal_force_cwd<CR>", opts)
keymap("n", "<leader>e", ":Neotree toggle reveal_force_cwd<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>ft", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>", opts)
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
keymap("n", "<leader>fp", "<cmd>Telescope projects<cr>", opts)

-- Git
keymap("n", "<leader>lg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

-- Alpha
keymap("n", "<leader>db", ":Alpha<CR>", opts)

-- Diagnostics in details
keymap("n", "<leader>xx", "<cmd>Trouble<cr>", opts)
keymap("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>", opts)
keymap("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>", opts)
keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>", opts)
keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", opts)
keymap("n", "gR", "<cmd>Trouble lsp_references<cr>", opts)

-- LSP
keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format()<CR>", opts)
keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
keymap("n", "<leader>li", ":LspInfo<CR>", opts)
keymap("n", "<leader>lI", ":LspInstallInfo<CR>", opts)
keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
keymap("n", "<C-s>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
keymap("n", "<S-e>", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
keymap("n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
keymap("n", "gl", '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ border = "rounded" })<CR>', opts)
keymap("n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)

