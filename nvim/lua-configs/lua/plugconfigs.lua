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

-- nvim LSP-CONFIG
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<C-n>', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', '<C-N>', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)

end

-- nvim-compe | completitions on nvim
vim.o.completeopt = "menuone,noselect"
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
    ultisnips = true;
  };
}

local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('i', '<expr> <Tab>', 'compe#complete()', opts)
vim.api.nvim_set_keymap('i', '<expr> <CR>', 'compe#confirm(\'<CR>\')', opts)
vim.api.nvim_set_keymap('i', '<C-e>', 'compe#close(\'<C-e>\')', opts)
vim.api.nvim_set_keymap('i', '<C-f>', 'compe#scroll({ \'delta\': +4 })', opts)
vim.api.nvim_set_keymap('i', '<C-d>', 'compe#scroll({ \'delta\': -4 })', opts)
