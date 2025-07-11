require("bc-editor.autorun")

-- GLOBAL OPTS
vim.o.scrolloff = 2
vim.o.showmode = false -- una barra de estado ya muestra el modo
vim.o.joinspaces = false
vim.o.hidden = true
vim.o.mouse = "nvc" -- quiza lo tenga que cambiar a 'a'
vim.o.swapfile = false
-- neovide font
vim.cmd([[set guifont=SauceCodePro\ Nerd\ Font:h15]])
vim.api.nvim_command("set undodir=~/.config/nvim/undodir")
vim.api.nvim_command("set undofile")
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.termguicolors = true
vim.o.background = "dark"
-- vim.o.fileencoding = "utf-8" -- The encoding written to file -- Es necesario?
vim.o.wrap = false

--[[
things neovim does by default and may not really need them
vim.cmd('syntax enable')
--]]
-- LOCAL OPTS TO WINDOW
-- I may need to set the global "vim.o.{option}" for some of them to work properly
vim.wo.number = true
vim.o.conceallevel = 0
vim.wo.conceallevel = 0
vim.wo.concealcursor = "i"
vim.wo.relativenumber = true
vim.wo.colorcolumn = "100"
vim.wo.signcolumn = "yes"

-- LOCAL OPTS TO BUFFER
-- I may need to set the global "vim.o.{option}" for some of them to work properly
vim.bo.autoindent = true

vim.bo.tabstop = 4
vim.o.tabstop = 4
vim.bo.shiftwidth = 4
vim.o.fixendofline = false
vim.o.shiftwidth = 4

vim.cmd([[au TextYankPost * silent! lua vim.highlight.on_yank()]])
vim.o.inccommand = "split"

vim.cmd([[
    augroup markdownSpell
        autocmd!
        autocmd FileType tex,markdown setlocal spell spelllang=en
        autocmd BufRead,BufNewFile *.tex,*.md setlocal spell spelllang=en
    augroup END
  ]])

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "md",
--
--   callback = function()
--     vim.cmd([[setlocal spell spelllang=es]])
--   end,
-- })
