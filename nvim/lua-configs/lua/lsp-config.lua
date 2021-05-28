-- nvim LSP-CONFIG
local nvim_lsp = require("lspconfig")

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  local opts = {noremap = true, silent = true}
  buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
  buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
  buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
  buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
  buf_set_keymap("n", "<c-k>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
  buf_set_keymap("n", "gre", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
  buf_set_keymap("n", "grn", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
  buf_set_keymap("n", "<c-n>", "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", opts)
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
        -- workspace = {
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
        -- workspace = {
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
      version = 'LuaJIT',
      path = vim.split(package.path, ';'),
    },
    diagnostics = {
      -- Get the language server to recognize the `vim` global
      globals = {'vim'},
    },
    workspace = {
      -- Make the server aware of Neovim runtime files
      library = {
        [vim.fn.expand('$VIMRUNTIME/lua')] = true,
        [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
      },
    },
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
    on_attach = on_attach,
  }
end

-- lsp-install
local function setup_servers()
  require'lspinstall'.setup()

  -- get all installed servers
  local servers = require'lspinstall'.installed_servers()
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
      config.filetypes = {"swift", "objective-c", "objective-cpp"}; -- we don't want c and cpp!
    end
    if server == "clangd" then
      config.filetypes = {"c", "cpp"}; -- we don't want objective-c and objective-cpp!
    end

    require'lspconfig'[server].setup(config)
  end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end
