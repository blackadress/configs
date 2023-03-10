require("bc-editor.autorun")

local keymap_set = vim.keymap.set

--leader
vim.api.nvim_set_keymap("n", "<Space>", "<NOP>", { noremap = true, silent = true })
vim.g.mapleader = " "

-- copy to systemclipboard
keymap_set("x", "<C-c>", '"+y')

-- no highlight on search
keymap_set("n", "<Leader><Leader>", ":nohlsearch<CR>")

--move line
-- vim.api.nvim_set_keymap('x', 'K', ':move \'<-2<CR>gv-gv', { noremap = true })
-- vim.api.nvim_set_keymap('x', 'J', ':move \'>+1<CR>gv-gv', { noremap = true })

-- better indenting
keymap_set("v", "<", "<gv")
keymap_set("v", ">", ">gv")

-- shortcut para mostrar los trailing <Space> y <Tab>
vim.api.nvim_set_keymap("n", "<F5>", ":set list!<CR>", { noremap = true })
vim.api.nvim_set_keymap("v", "<F5>", "<Esc>:set list!<CR>", { noremap = true })

-- new tab
vim.api.nvim_set_keymap("n", "tn", ":tabnew<CR>", { noremap = true })

-- desplazamiento tabs
vim.api.nvim_set_keymap("n", "<Left>", "gT", { noremap = true })
vim.api.nvim_set_keymap("n", "<A-h>", "gT", { noremap = true })
vim.api.nvim_set_keymap("n", "<Right>", "gt", { noremap = true })
vim.api.nvim_set_keymap("n", "<A-l>", "gt", { noremap = true })

-- buffer split in normal mode
vim.api.nvim_set_keymap("n", "<Leader>v", ":vertical split<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>a", ":split<CR>", { noremap = true })

-- guardar con <C-s>
vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })

-- mover entre splitted buffers
vim.api.nvim_set_keymap("n", "<Leader>h", "<C-w>h", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>l", "<C-w>l", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>k", "<C-w>k", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>j", "<C-w>j", { noremap = true })
-- swap splitted buffers
vim.api.nvim_set_keymap("n", "<Leader><Left>", "<C-w>r", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader><Right>", "<C-w>r", { noremap = true })
-- resize splitted buffer
vim.api.nvim_set_keymap("n", "<C-w><Left>", "<C-w><", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-w><Right>", "<C-w>>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-w><Up>", "<C-w>+", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-w><Down>", "<C-w>-", { noremap = true })

-- ESC remappings
vim.api.nvim_set_keymap("i", "<A-j>", "<Esc>", { noremap = true })
vim.api.nvim_set_keymap("v", "<A-j>", "<Esc>", { noremap = true })
vim.api.nvim_set_keymap("i", "<C-j>", "<Esc>", { noremap = true })
vim.api.nvim_set_keymap("v", "<C-j>", "<Esc>", { noremap = true })

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
map("n", "<Leader>e", "<cmd>Lspsaga show_line_diagnostics<CR>", { noremap = true, silent = true })
map("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", opts)

map("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
map("v", "<leader>ca", "<cmd><C-U>Lspsaga range_code_action<CR>", opts)

map("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
map("n", "gs", "<cmd>Lspsaga signature_help<CR>", opts)
map("n", "gr", "<cmd>Lspsaga rename<CR>", opts)
map("n", "<leader>gd", "<cmd>Lspsaga preview_definition<CR>", opts)
map("n", "<leader>e", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
map("n", "<leader>cc", "<cmd>lua require'lspsaga.diagnostic'.show_cursor_diagnostics<CR>", opts)
map("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
map("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)

map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
-- buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
map("n", "<c-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
map("n", "grr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
-- buf_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
-- buf_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)

map("n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
map("n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
map(
  "n",
  "<leader>wl",
  "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
  opts
)
map("n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
map("n", "<leader>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
-- execute current
map("n", "<leader>x", "<cmd>source %<CR>", opts)
