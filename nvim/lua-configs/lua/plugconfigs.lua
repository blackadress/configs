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

-- TELESCOPE
require('telescope').setup {
	defaults = {
		file_sorter = require'telescope.sorters'.get_fuzzy_file,
		extensions = {
			fzy_native = {
				override_generic_sorter = false,
				override_file_sorter = true,
			}
		}
	}
}
require('telescope').load_extension('fzy_native')
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
	buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
	buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
	buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
	buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
	buf_set_keymap('n', '<c-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
	buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
	buf_set_keymap('n', '<c-n>', '<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>', opts)
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

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif vim.fn.call("vsnip#available", {1}) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    -- If <S-Tab> is not working in your terminal, change it to <C-h>
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

-- local opts = { noremap=true, silent=true }
-- vim.api.nvim_set_keymap('i', '<expr><Tab>', 'compe#complete()', opts)
-- vim.api.nvim_set_keymap('i', '<expr><CR>', 'compe#confirm(\'<CR>\')', opts)
-- vim.api.nvim_set_keymap('i', '<C-e>', 'compe#close(\'<C-e>\')', opts)
-- vim.api.nvim_set_keymap('i', '<C-f>', 'compe#scroll({ \'delta\': +4 })', opts)
-- vim.api.nvim_set_keymap('i', '<C-d>', 'compe#scroll({ \'delta\': -4 })', opts)
