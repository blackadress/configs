return {
  -- lsp
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "glepnir/lspsaga.nvim",
  },
  config = function()
    require("bc-lsp")
  end,
  -- { "lewis6991/spellsitter.nvim", dependencies = "nvim-treesitter/nvim-treesitter" },
}
