return {
  -- lsp
  "mason-org/mason-lspconfig.nvim",
  dependencies = {
    "mason-org/mason.nvim",
    "neovim/nvim-lspconfig",
    "nvimdev/lspsaga.nvim",
    "Hoffs/omnisharp-extended-lsp.nvim",
  },
  config = function()
    require("bc-lsp")
  end,
  -- { "lewis6991/spellsitter.nvim", dependencies = "nvim-treesitter/nvim-treesitter" },
}
