return {
  -- debugger dap
  { "mfussenegger/nvim-dap" },
  { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap" } },
  { "theHamsta/nvim-dap-virtual-text", dependencies = { "mfussenegger/nvim-dap" } },

  -- editor
  -- { "vladdoster/remember.nvim", lazy = false, config = [[ require("remember") ]] },
  { "akinsho/bufferline.nvim", dependencies = "kyazdani42/nvim-web-devicons" },
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
  "rebelot/kanagawa.nvim",
  "nyoom-engineering/oxocarbon.nvim",
  { "challenger-deep-theme/vim", name = "challenger-deep" },
  "liuchengxu/space-vim-dark",
  "sainnhe/edge",
  "lunarvim/horizon.nvim",
  "gbprod/nord.nvim",
  "savq/melange-nvim",

  "romainl/flattened",
  "hachy/eva01.vim",
  "tyrannicaltoucan/vim-deep-space",
  "wadackel/vim-dogrun",
  "danilo-augusto/vim-afterglow",
  "ajmwagar/vim-deus",
  "w0ng/vim-hybrid",
}
