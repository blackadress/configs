-- nvim LSP-CONFIG
local nvim_lsp = require("lspconfig")

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  local saga = require("lspsaga")
  saga.init_lsp_saga()

  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  local opts = {noremap = true, silent = true}
  buf_set_keymap("n", "gh", "<cmd>lua require('lspsaga.provider').lsp_finder()<CR>", opts)
  buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  -- buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", "gd", "<cmd>lua require('lspsaga.provider').preview_definition()<CR>", opts)
  buf_set_keymap("n", "gs", "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>", opts)
  -- buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap("n", "K", "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", opts)
  buf_set_keymap(
    "n",
    "<C-f>",
    "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>",
    opts
  )
  buf_set_keymap(
    "n",
    "<C-b>",
    "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>",
    opts
  )
  buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  buf_set_keymap("n", "<c-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  buf_set_keymap("n", "grr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  -- buf_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  buf_set_keymap("n", "<leader>rn", "<cmd>lua require('lspsaga.rename').rename()<CR>", opts)
  -- buf_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  buf_set_keymap(
    "n",
    "<leader>ca",
    "<cmd>lua require('lspsaga.codeaction').code_action()<CR>",
    opts
  )
  buf_set_keymap(
    "v",
    "<leader>ca",
    "<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>",
    opts
  )
  buf_set_keymap("n", "<c-n>", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)

  buf_set_keymap("n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
  buf_set_keymap("n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
  buf_set_keymap(
    "n",
    "<leader>wl",
    "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
    opts
  )
  buf_set_keymap("n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  buf_set_keymap("n", "<leader>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
  -- buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
  buf_set_keymap(
    "n",
    "[d",
    "<cmd>lua lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>",
    opts
  )
  -- buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
  buf_set_keymap(
    "n",
    "]d",
    "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>",
    opts
  )
  -- buf_set_keymap("n", "<leader>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
  buf_set_keymap(
    "n",
    "<leader>e",
    "<cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>",
    opts
  )
  buf_set_keymap(
    "n",
    "<leader>cc",
    "<cmd>lua require'lspsaga.diagnostic'.show_cursor_diagnostics()<CR>",
    opts
  )
end

-- local servers = {"rust_analyzer", "tsserver", "gopls", "pyright"}
-- for _, lsp in ipairs(servers) do
--   nvim_lsp[lsp].setup {on_attach = on_attach}
-- end

-- nvim_lsp.sumneko_lua.setup{}
-- require "lspconfig".sumneko_lua.setup {
--   cmd = {"/usr/bin/lua-language-server", "-E", "/usr/share/lua-language-server/main.lua"},
--   settings = {
--     settings = {
--       Lua = {
-- runtime = {
--   version = "Lua 5.3",
--   path = {
--     "/usr/share/lua/5.3/lgi/init.lua"
--   }
-- },
-- workleader = {
--   library = {
--     [vim.fn.expand "~/.luarocks/share/lua/5.3"] = true,
--     ["/usr/share/lua/5.3"] = true
--   }
-- }

-- runtime = {
--   version = "LuaJIT",
--   path = vim.split(package.path, ";")
-- },
-- diagnostics = {
--   globals = {"vim"}
-- },
-- workleader = {
--   library = {
--     [vim.fn.expand("$VIMRUNTIME/lua")] = true,
--     [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
--   }
-- }
--       }
--     }
--   }
-- }

-- Configure lua language server for neovim development
local lua_settings = {
  Lua = {
    runtime = {
      -- LuaJIT in the case of Neovim
      version = "LuaJIT",
      path = vim.split(package.path, ";")
    },
    diagnostics = {
      -- Get the language server to recognize the `vim` global
      globals = {"vim"}
    },
    workleader = {
      -- Make the server aware of Neovim runtime files
      library = {
        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
        [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
      }
    }
  }
}

-- config that activates keymaps and enables snippet support
local function make_config()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  return {
    -- enable snippet support
    capabilities = capabilities,
    -- map buffer local keybindings when the language server attaches
    on_attach = on_attach
  }
end

-- lsp-install
local function setup_servers()
  require "lspinstall".setup()

  -- get all installed servers
  local servers = require "lspinstall".installed_servers()
  -- ... and add manually installed servers
  table.insert(servers, "clangd")
  table.insert(servers, "sourcekit")

  for _, server in pairs(servers) do
    local config = make_config()

    -- language specific config
    if server == "lua" then
      config.settings = lua_settings
    end
    if server == "sourcekit" then
      config.filetypes = {"swift", "objective-c", "objective-cpp"} -- we don't want c and cpp!
    end
    if server == "clangd" then
      config.filetypes = {"c", "cpp"} -- we don't want objective-c and objective-cpp!
    end

    require "lspconfig"[server].setup(config)
  end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require "lspinstall".post_install_hook = function()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end
