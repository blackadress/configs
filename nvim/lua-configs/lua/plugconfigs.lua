-- VIMWIKI
vim.api.nvim_set_var('vimwiki_list', { path = '~/Documents/vimwiki/' })

-- AIRLINE
-- mostrar buffers como pestañas
vim.api.nvim_set_var('airline#extensions#tabline#enabled', 1)
-- mostrar solo el nombre del archivo
vim.api.nvim_set_var('airline#extensions#tabline#fnamemomd', ':t')
vim.api.nvim_set_var('airline_theme', 'solarized_flood')

-- INDENTLINE
-- probablemente cause problemas? el asignar arrays a variables?
vim.api.nvim_set_var('indentLine_fileTypeExclude', ['text', 'help', 'terminal'])
vim.api.nvim_set_var('indentLine_bufNameExclude', ['NERD_tree.*', 'term:.*'])

-- NERDTree // a ser reemplazado por nvim-tree.lua
vim.api.nvim_set_var('NERDTreeGitStatusWithFlags', 1)
vim.api.nvim_set_var('NERDTreeChDirMode', 2)
vim.api.nvim_set_var('NERDTreeIgnore', ['^node_modules$'])
vim.api.nvim_set_keymap('nvo', '<F4>', ':NERDTreeToggle<CR>', { silent = true })

