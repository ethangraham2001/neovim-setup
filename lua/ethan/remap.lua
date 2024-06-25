vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<cr>", opts);
vim.keymap.set("n", "<leader>d", ':lua vim.diagnostic.open_float(0, {scope="line"})<cr>')
vim.keymap.set("n", "<leader>pwd", ":lua print(vim.fn.expand(\"%:p:h\"))<CR>", opts)

