local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({"git", "clone", "https://github.com/wbthomason/packer.nvim", install_path})
  execute "packadd packer.nvim"
end

return require("packer").startup(
  function()
    use "wbthomason/packer.nvim"
    use {"kyazdani42/nvim-tree.lua", requires = {"kyazdani42/nvim-web-devicons"}}
    use {"lewis6991/gitsigns.nvim", requires = {"nvim-lua/plenary.nvim"}}

    -- falta configurar*
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
    use "neovim/nvim-lspconfig"
    use "kabouzeid/nvim-lspinstall"
    use "glepnir/lspsaga.nvim"

    use {
      "nvim-telescope/telescope.nvim",
      requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}}
    }
    use {"nvim-telescope/telescope-fzy-native.nvim"}
    use {
      "glepnir/galaxyline.nvim",
      branch = "main",
      requires = {"kyazdani42/nvim-web-devicons", opt = true}
    }

    use "rafamadriz/friendly-snippets"
    use "hrsh7th/vim-vsnip"
    use "hrsh7th/nvim-compe"
    use "windwp/nvim-autopairs"
    use "windwp/nvim-ts-autotag"
    use "terrortylor/nvim-comment"
    use "mhartington/formatter.nvim"
    use "tpope/vim-surround"

    use "mattn/emmet-vim"

    --color themes
    use "folke/tokyonight.nvim"

    use "vimwiki/vimwiki"
    use "norcalli/nvim-colorizer.lua"

    -- Soporte sintactico de lenguaje
    -- use "HerringtonDarkholme/yats.vim"
    -- use "MaxMEllon/vim-jsx-pretty"
    -- use "yuezk/vim-js"
    -- use "rust-lang/rust.vim"
    use "neovimhaskell/haskell-vim"
  end
)
