local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  use 'scrooloose/nerdtree'
  use 'Xuyuanp/nerdtree-git-plugin'
  use 'tiagofumo/vim-nerdtree-syntax-highlight'
  use 'ryanoasis/vim-devicons'
  use 'airblade/vim-gitgutter'
  use 'ctrlpvim/ctrlp.vim'
  use 'Yggdroot/indentLine'
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use 'scrooloose/nerdcommenter'
  use { 'neoclide/coc.nvim', 'branch': 'release' }
  use 'norcalli/nvim-colorizer.lua'
  use 'vimwiki/vimwiki'

  --color themes
  use 'romainl/flattened'
  use 'challenger-deep-theme/vim'
  use 'liuchengxu/space-vim-dark'
  use 'sainnhe/edge'
  use 'morhetz/gruvbox'

  use 'tyrannicaltoucan/vim-deep-space'
  use 'wadackel/vim-dogrun'
  use 'danilo-augusto/vim-afterglow'
  use 'hachy/eva01.vim'
  use 'ajmwagar/vim-deus'
  use 'w0ng/vim-hybrid'

  use 'glepnir/oceanic-material'

  
  -- Soporte sintactico de lenguaje
  -- todavia no estoy usando el LSP nativo de neovim
  -- use 'sheerun/vim-polyglot'
  use 'HerringtonDarkholme/yats.vim'
  use 'MaxMEllon/vim-jsx-pretty'
  use 'yuezk/vim-js'
  use 'elmcast/elm-vim'
  use { 'fatih/vim-go', run = ':GoUpdateBinaries' }
  use { 'numirias/semshi', run = ':UpdateRemote  useins' }
  use 'rust-lang/rust.vim'
  use 'habamax/vim-godot'
  use 'neovimhaskell/haskell-vim'

end)
