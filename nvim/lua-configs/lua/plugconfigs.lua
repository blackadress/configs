-- VIMWIKI
vim.api.nvim_set_var('vimwiki_list', { { path = '~/Documents/vimwiki/' } })

-- AIRLINE
-- mostrar buffers como pestañas
vim.api.nvim_set_var('airline#extensions#tabline#enabled', 1)
-- mostrar solo el nombre del archivo
vim.api.nvim_set_var('airline#extensions#tabline#fnamemomd', ':t')
vim.api.nvim_set_var('airline_theme', 'solarized_flood')

-- COMMENTS
require('nvim_comment').setup {
  comment_empty = false,
  create_mappings = true,
  line_mapping = "<Leader>==",
  operator_mapping = "<Leader>="
}


-- NVIM-TREE
vim.api.nvim_set_keymap('n', '<F4>', ':NvimTreeToggle<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<Leader>r', ':NvimTreeRefresh<CR>', { silent = true })
local tree_cb = require'nvim-tree.config'.nvim_tree_callback
vim.g.nvim_tree_bindings = {
  ["sv"] = tree_cb("vsplit"),
  ["sa"] = tree_cb("split"),
}
--vim.api.nvim_set_keymap('n', '<Leader>n', ':NvimTreeFindFile<CR>', { silent = true })
--
--GITSIGNS
require('gitsigns').setup {
  numhl = false,
  linehl = false,
  watch_index = {
    interval = 1000
  },
  current_line_blame = false,
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  use_decoration_api = true,
  use_internal_diff = true,  -- If luajit is present
}

-- telescope
vim.api.nvim_set_keymap('n', '<C-p>', ':Telescope find_files<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>fg', ':Telescope live_grep<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>fb', ':Telescope buffers<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>fh', ':Telescope help_tags<CR>', { noremap = true })
