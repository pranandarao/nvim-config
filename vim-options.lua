vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.cmd("set number")

vim.keymap.set("i", "jk", "<Esc>", {})
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", {})
vim.keymap.set("t", "jk", "<C-\\><C-n>", {})

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

