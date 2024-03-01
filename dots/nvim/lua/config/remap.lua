vim.g.mapleader = " "

vim.keymap.set("n", "<leader>df", vim.cmd.Ex)
vim.keymap.set("n", "<leader>s", vim.cmd.w)
vim.keymap.set("n", "<esc>", vim.cmd.noh)
vim.keymap.set("n", "U", vim.cmd.redo)

-- vim.api.nvim_set_keymap('i', '<Esc>', '<Esc>:w<CR>', { noremap = true })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("x", "R", "\"_dP")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<leader>m", vim.cmd.bn)
vim.keymap.set("n", "<leader>n", vim.cmd.bp)
vim.keymap.set("n", "<leader>b", vim.cmd.bd)
vim.keymap.set("n", "<leader>,", vim.cmd.buffers)

vim.keymap.set("n", "<leader>lf", "<nop>")
