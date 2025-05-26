vim.o.shell = "powershell"

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.cmd("set number")

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set("i", "jk", "<Esc>", {})
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", {})
vim.keymap.set("t", "jk", "<C-\\><C-n>", {})
-- vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>:bd!<CR>", {})
vim.keymap.set("n", "<leader>bt", ":belowright 12split | terminal<CR>", {})

-- Function to close terminal buffer
---@diagnostic disable-next-line: lowercase-global
function close_terminal()
  local buftype = vim.api.nvim_buf_get_option(0, "buftype")
  if buftype == "terminal" then
    vim.cmd("bd!")  -- Force close terminal buffer
  end
end

-- Terminal mode mapping
vim.api.nvim_set_keymap("t", "<Esc><Esc>", [[<C-\><C-n>:lua close_terminal()<CR>]], { noremap = true, silent = true })

-- Normal mode mapping (will check if in terminal buffer before closing)
vim.api.nvim_set_keymap("n", "<Esc><Esc>", [[:lua close_terminal()<CR>]], { noremap = true, silent = true })


vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- require("vim-options")
require("lazy").setup("plugins")
