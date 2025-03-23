vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', {desc="Remove search highlight"})
-- vim.keymap.set("n", "-", ':lua require("oil").toggle_float()<CR>', {desc="[T]oggle [F]loating Oil"})
vim.keymap.set( "n", "gl", function() vim.diagnostic.open_float() end, {desc = "[L]SP [D]iagnostics"})

-- Better split navigator
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
