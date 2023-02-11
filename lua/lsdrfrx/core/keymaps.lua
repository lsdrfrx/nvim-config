vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

keymap.set("n", "<leader>u", ":undo<CR>")
keymap.set("i", "<S-Tab>", "<C-d>")

keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<F10>", ":tabn<CR>") --  go to next tab
keymap.set("n", "<F9>", ":tabp<CR>") --  go to previous tab

keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>") -- livegrep
keymap.set("n", "<leader>ff", ":Telescope find_files<CR>") -- find file

keymap.set("n", "<leader>gs", vim.cmd.Git)
