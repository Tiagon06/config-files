local keymap = vim.keymap

vim.g.mapleader = " "

-- move cursor
keymap.set({ "n", "v", "o"}, "j", "h")
keymap.set({ "n", "v", "o"}, "k", "j")
keymap.set({ "n", "v", "o"}, "l", "k")
keymap.set({ "n", "v", "o"}, "ç", "l")

-- go back to normal mode
keymap.set("i", "jk", "<ESC>")

-- clear search highlights
keymap.set("n", "<leader>h", ":nohl<CR>")

-- scroll
keymap.set({ "n", "v"}, "<C-k>", "10jzz")
keymap.set({ "n", "v"}, "<C-l>", "10kzz")

-- move lines
keymap.set("v", "K", ":m '>+1<CR>gv=gv")
keymap.set("v", "L", ":m '>-2<CR>gv=gv")
keymap.set("v", "Ç", ">V")
keymap.set("v", "J", "<V")

-- open explorer
keymap.set("n", "<leader>e", ":Ex<CR>")
