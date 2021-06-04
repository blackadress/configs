--leader
vim.api.nvim_set_keymap("n", "<Space>", "<NOP>", {noremap = true, silent = true})
vim.g.mapleader = " "

-- copy to systemclipboard
vim.api.nvim_set_keymap("x", "<C-c>", '"+y', {noremap = true})

-- no highlight on search
vim.api.nvim_set_keymap("n", "<Leader><Leader>", ":nohlsearch<CR>", {noremap = true})

--move line
-- vim.api.nvim_set_keymap('x', 'K', ':move \'<-2<CR>gv-gv', { noremap = true })
-- vim.api.nvim_set_keymap('x', 'J', ':move \'>+1<CR>gv-gv', { noremap = true })

-- better indenting
vim.api.nvim_set_keymap("v", "<", "<gv", {noremap = true})
vim.api.nvim_set_keymap("v", ">", ">gv", {noremap = true})

-- shortcut para mostrar los trailing <Space> y <Tab>
vim.api.nvim_set_keymap("n", "<F5>", ":set list!<CR>", {noremap = true})
vim.api.nvim_set_keymap("v", "<F5>", "<Esc>:set list!<CR>", {noremap = true})

-- new tab
vim.api.nvim_set_keymap("n", "tn", ":tabnew<CR>", {noremap = true})
-- desplazamiento tabs
vim.api.nvim_set_keymap("n", "<S-Tab>", "gT", {noremap = true})
-- vim.api.nvim_set_keymap("n", "<Tab>", "gt", {noremap = true})

-- buffer split in normal mode
vim.api.nvim_set_keymap("n", "<Leader>v", ":vertical split<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>a", ":split<CR>", {noremap = true})

-- guardar con <C-s>
vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", {noremap = true, silent = true})

-- mover entre splitted buffers
vim.api.nvim_set_keymap("n", "<Leader>h", "<C-w>h", {noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>l", "<C-w>l", {noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>k", "<C-w>k", {noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>j", "<C-w>j", {noremap = true})
-- swap splitted buffers
vim.api.nvim_set_keymap("n", "<Leader><Left>", "<C-w>r", {noremap = true})
vim.api.nvim_set_keymap("n", "<Leader><Right>", "<C-w>r", {noremap = true})
-- resize splitted buffer
vim.api.nvim_set_keymap("n", "<C-w><Left>", "<C-w><", {noremap = true})
vim.api.nvim_set_keymap("n", "<C-w><Right>", "<C-w>>", {noremap = true})
vim.api.nvim_set_keymap("n", "<C-w><Up>", "<C-w>+", {noremap = true})
vim.api.nvim_set_keymap("n", "<C-w><Down>", "<C-w>-", {noremap = true})

-- ESC remappings
vim.api.nvim_set_keymap("i", "<A-j>", "<Esc>", {noremap = true})
vim.api.nvim_set_keymap("v", "<A-j>", "<Esc>", {noremap = true})
vim.api.nvim_set_keymap("i", "<C-j>", "<Esc>", {noremap = true})
vim.api.nvim_set_keymap("v", "<C-j>", "<Esc>", {noremap = true})
