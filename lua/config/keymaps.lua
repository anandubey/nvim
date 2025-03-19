vim.keymap.set("n", "<c-e>", ':lua require("oil").toggle_float()<CR>', {desc="[T]oggle [F]loating Oil"})
vim.keymap.set(
    "n",
    "gl",
    function()
        vim.diagnostic.open_float()
    end,
    {desc = "[L]SP [D]iagnostics"}
)
