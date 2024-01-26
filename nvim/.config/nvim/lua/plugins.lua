local fn = vim.fn

local lazypath = fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("bc-plugins")

-- require("lazy").setup({
--   config = {
--     dev = {
--       path = "~/proyectos/lua",
--       fallback = true,
--       patterns = { "blackadress" },
--     },
--   },
--
--
--   -- completion
--
--   -- "hrsh7th/cmp-vsnip",
--   -- "hrsh7th/vim-vsnip",
--
--   -- "oberblastmeister/neuron.nvim",
--   -- {
--   --   "pyrho/nerveux.nvim",
--   --   dependencies = {
--   --     "nvim-lua/plenary.nvim",
--   --     "nvim-lua/popup.nvim",
--   --     "nvim-telescope/telescope.nvim",
--   --   },
--   -- },
--
--   -- Soporte sintactico de lenguaje
--   { "nanotee/sqls.nvim" },
-- })
