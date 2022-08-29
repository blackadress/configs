-- meterlo todo a una funcion?
vim.o.foldcolumn = "1"
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

-- -- Option 2: nvim lsp as LSP client
-- -- Tell the server the capability of foldingRange,
-- -- Neovim hasn't added foldingRange to default capabilities, users must add it manually
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.foldingRange = {
--   dynamicRegistration = false,
--   lineFoldingOnly = true,
-- }
-- local language_servers = {
--   "angularls",
--   "bashls",
--   "emmet_ls",
--   "gopls",
--   "pyright",
--   "rust_analyzer",
--   "sqls",
--   "sumneko_lua",
--   "texlab",
--   "tsserver",
-- } -- like {'gopls', 'clangd'}
-- for _, ls in ipairs(language_servers) do
--   require("lspconfig")[ls].setup({
--     capabilities = capabilities,
--     other_fields = ...,
--   })
-- end
-- require("ufo").setup()
--

-- Option 3: treesitter as a main provider instead
-- Only depend on `nvim-treesitter/queries/filetype/folds.scm`,
-- performance and stability are better than `foldmethod=nvim_treesitter#foldexpr()`
require("ufo").setup({
  provider_selector = function(bufnr, filetype, buftype)
    return { "treesitter", "indent" }
  end,
})
