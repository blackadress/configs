local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
  execute("packadd packer.nvim")
end

return require("packer").startup(function(use)
  use("wbthomason/packer.nvim")
  use({ "kyazdani42/nvim-tree.lua", requires = { "kyazdani42/nvim-web-devicons" } })
  use({ "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" } })

  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
  use("neovim/nvim-lspconfig")
  use("williamboman/nvim-lsp-installer")
  -- use("tami5/lspsaga.nvim")
  use("glepnir/lspsaga.nvim")
  use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" })
  use({ "lewis6991/spellsitter.nvim", requires = "nvim-treesitter/nvim-treesitter" })

  use({
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
  })
  use({ "nvim-telescope/telescope-fzy-native.nvim" })
  use({ "akinsho/bufferline.nvim", requires = "kyazdani42/nvim-web-devicons" })
  use({ "nvim-lualine/lualine.nvim" })

  -- rest client
  -- use {"NTBBloodbath/rest.nvim", requires = {"nvim-lua/plenary.nvim"}}
  --patched version of above
  use({ "~/proyectos/lua/rest.nvim", branch = "estable" })
  -- use("~/proyectos/lua/first-plugin")

  -- completion
  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-nvim-lua")
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-cmdline")

  -- use("hrsh7th/cmp-vsnip")
  -- use("hrsh7th/vim-vsnip")
  use("L3MON4D3/LuaSnip")
  use("saadparwaiz1/cmp_luasnip")
  use("rafamadriz/friendly-snippets")

  use("windwp/nvim-autopairs")
  use("windwp/nvim-ts-autotag")
  use("numToStr/Comment.nvim")
  use("mhartington/formatter.nvim")
  use("tpope/vim-surround")

  -- use "mattn/emmet-vim"

  -- color themes
  -- lua
  use("folke/tokyonight.nvim")
  use("luisiacc/gruvbox-baby")
  use("ellisonleao/gruvbox.nvim")
  use("sainnhe/gruvbox-material")
  use("projekt0n/github-nvim-theme")
  use("Iron-E/nvim-soluarized")
  use("marko-cerovac/material.nvim")
  use("Yagua/nebulous.nvim")
  use({ "catppuccin/nvim", as = "catppuccin" })
  use("daschw/leaf.nvim")
  use("EdenEast/nightfox.nvim")
  use {'articblush/articblush.nvim', as = 'articblush'}

  -- support italics
  use("challenger-deep-theme/vim")
  use("liuchengxu/space-vim-dark")
  use("sainnhe/edge")
  use("lunarvim/horizon.nvim")

  -- use("morhetz/gruvbox")
  use("kadekillary/subtle_solo")
  use("romainl/flattened")
  use("hachy/eva01.vim")
  use("tyrannicaltoucan/vim-deep-space")
  use("wadackel/vim-dogrun")
  use("danilo-augusto/vim-afterglow")
  use("ajmwagar/vim-deus")
  use("w0ng/vim-hybrid")

  use("vimwiki/vimwiki")
  -- use("oberblastmeister/neuron.nvim")
  use({
    "pyrho/nerveux.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-lua/popup.nvim",
      "nvim-telescope/telescope.nvim",
    },
  })
  use("norcalli/nvim-colorizer.lua")

  -- Soporte sintactico de lenguaje
  -- use "rust-lang/rust.vim"
  use({ "neovimhaskell/haskell-vim", ft = "hs" })
  use({ "nanotee/sqls.nvim" })
end)
