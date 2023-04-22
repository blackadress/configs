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

require("lazy").setup({
  config = {
    dev = {
      path = "~/proyectos/lua",
      fallback = true,
      patterns = { "blackadress" },
    },
  },
  { "kyazdani42/nvim-tree.lua", dependencies = { "kyazdani42/nvim-web-devicons" } },
  { "lewis6991/gitsigns.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/playground",
      "nvim-treesitter/nvim-treesitter-refactor",
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
  },
  {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  "glepnir/lspsaga.nvim",
  { "kevinhwang91/nvim-ufo", dependencies = "kevinhwang91/promise-async" },
  { "lewis6991/spellsitter.nvim", dependencies = "nvim-treesitter/nvim-treesitter" },

  -- debugger dap
  { "mfussenegger/nvim-dap" },
  { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap" } },
  { "theHamsta/nvim-dap-virtual-text", dependencies = { "mfussenegger/nvim-dap" } },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
  },
  { "nvim-telescope/telescope-fzy-native.nvim" },
  { "akinsho/bufferline.nvim", dependencies = "kyazdani42/nvim-web-devicons" },
  { "nvim-lualine/lualine.nvim" },

  -- rest client
  -- use {"NTBBloodbath/rest.nvim", dependencies = {"nvim-lua/plenary.nvim"}}
  --patched version of above
  -- { "blackadress/rest.nvim", branch = "response_body_stored" },
  { "blackadress/rest.nvim", dir = "~/proyectos/lua/rest.nvim", lazy = true, ft = "http" },

  -- completion
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-nvim-lua",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-cmdline",

  -- "hrsh7th/cmp-vsnip",
  -- "hrsh7th/vim-vsnip",
  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",
  "rafamadriz/friendly-snippets",

  "windwp/nvim-autopairs",
  "windwp/nvim-ts-autotag",
  "numToStr/Comment.nvim",
  "mhartington/formatter.nvim",
  "tpope/vim-surround",

  -- color themes
  -- lua
  "folke/tokyonight.nvim",
  "luisiacc/gruvbox-baby",
  "ellisonleao/gruvbox.nvim",
  "sainnhe/gruvbox-material",
  "projekt0n/github-nvim-theme",
  "Iron-E/nvim-soluarized",
  "marko-cerovac/material.nvim",
  "Yagua/nebulous.nvim",
  { "catppuccin/nvim", name = "catppuccin" },
  "daschw/leaf.nvim",
  "EdenEast/nightfox.nvim",
  { "challenger-deep-theme/vim", name = "challenger-deep" },
  "liuchengxu/space-vim-dark",
  "sainnhe/edge",
  "lunarvim/horizon.nvim",

  "kadekillary/subtle_solo",
  "romainl/flattened",
  "hachy/eva01.vim",
  "tyrannicaltoucan/vim-deep-space",
  "wadackel/vim-dogrun",
  "danilo-augusto/vim-afterglow",
  "ajmwagar/vim-deus",
  "w0ng/vim-hybrid",

  "vimwiki/vimwiki",
  -- "oberblastmeister/neuron.nvim",
  -- {
  --   "pyrho/nerveux.nvim",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-lua/popup.nvim",
  --     "nvim-telescope/telescope.nvim",
  --   },
  -- },
  {
    "epwalsh/obsidian.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
      "godlygeek/tabular",
      "nvim-treesitter/nvim-treesitter",
    },
  },
  "norcalli/nvim-colorizer.lua",

  -- Soporte sintactico de lenguaje
  { "nanotee/sqls.nvim" },
})
