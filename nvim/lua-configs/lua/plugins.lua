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

    use "terrortylor/nvim-comment"
    use {"nvim-telescope/telescope.nvim", requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}}}
    use {"nvim-telescope/telescope-fzy-native.nvim"}
    -- falta configurar
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
    use "mhartington/formatter.nvim"

    use "neovim/nvim-lspconfig"
    use "hrsh7th/vim-vsnip"
    use "hrsh7th/nvim-compe"

    use {
      "glepnir/galaxyline.nvim",
      branch = "main",
      requires = {"kyazdani42/nvim-web-devicons", opt = true}
    }

    use "norcalli/nvim-colorizer.lua"
    use "vimwiki/vimwiki"

    --color themes
    use "romainl/flattened"
    use "challenger-deep-theme/vim"
    use "liuchengxu/space-vim-dark"
    use "sainnhe/edge"
    use "morhetz/gruvbox"

    use "hachy/eva01.vim"
    use "tyrannicaltoucan/vim-deep-space"
    use "wadackel/vim-dogrun"
    use "danilo-augusto/vim-afterglow"
    use "ajmwagar/vim-deus"
    use "w0ng/vim-hybrid"

    -- Soporte sintactico de lenguaje
    -- todavia no estoy usando el LSP nativo de neovim
    -- falta configurar
    use "HerringtonDarkholme/yats.vim"
    use "MaxMEllon/vim-jsx-pretty"
    use "yuezk/vim-js"
    use {"numirias/semshi", run = ":UpdateRemote  useins"}
    use "rust-lang/rust.vim"
    use "neovimhaskell/haskell-vim"
  end
)
