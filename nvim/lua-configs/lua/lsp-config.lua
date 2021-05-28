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

local servers = {"rust_analyzer", "tsserver", "gopls", "pyright"}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {on_attach = on_attach}
end

-- nvim_lsp.sumneko_lua.setup{}
require "lspconfig".sumneko_lua.setup {
  cmd = {"/usr/bin/lua-language-server", "-E", "/usr/share/lua-language-server/main.lua"},
  settings = {
    settings = {
      Lua = {
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

        runtime = {
          version = "LuaJIT",
          path = vim.split(package.path, ";")
        },
        diagnostics = {
          globals = {"vim"}
        },
        workspace = {
          library = {
            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
            [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
          }
        }
      }
    }
  }
}
