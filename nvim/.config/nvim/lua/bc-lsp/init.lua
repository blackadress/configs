-- nvim LSP-CONFIG
-- local nvim_lsp = require("lspconfig")
-- require("lspconfig")
local lspsaga = require("lspsaga")
lspsaga.setup()

-- local on_attach = function(client, bufnr)
--   local function buf_set_keymap(...)
--     vim.api.nvim_buf_set_keymap(bufnr, ...)
--   end
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end
--
-- vim.cmd([[set updatetime=250]])
-- vim.cmd([[autocmd CursorHoldI * silent! lua require('lspsaga.signaturehelp').signature_help()]])

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

-- lsp-install
local lsp_installer = require("nvim-lsp-installer")
-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(
  function(server)
    local opts = {}

    if server.name == "lua" then
      opts.settings = lua_settings
    end
    if server.name == "sqls" then
      opts.cmd = {
        "/home/erland/.local/share/nvim/lsp_servers/sqls/sqls",
        "-config",
        "/home/erland/.local/share/nvim/lsp_servers/sqls/config.yml"
      }
      opts.on_attach = function(client, bufnr)
        require("sqls").on_attach(client, bufnr)
      end
    end

    -- This setup() function is exactly the same as lspconfig's setup function.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
  end
)

-- require("bc-lsp/lspsaga_config")
