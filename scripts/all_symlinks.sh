#!/bin/bash

# CONFIGURACIONES PROGRAMAS 
# configuracion nvim 
ln -s ~/Documents/configs/nvim/init.vim ~/.config/nvim/init.vim 
ln -s ~/Documents/configs/nvim/lua-configs/* ~/.config/nvim/ configuracion tmux 
ln -s ~/Documents/configs/tmux/tmux.conf ~/.tmux.conf
#ln -sf ~/Documents/configs/scripts/ide ~/bin/ide
# AWESOME WM
ln -s ~/Documents/configs/awesome/* ~/.config/awesome/

# configuracion terminal alacritty
ln -s ~/Documents/configs/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml

# BASH CONFIGS
ln -s ~/Documents/configs/bash-configs/bashrc ~/.bashrc
ln -s ~/Documents/configs/bash-configs/aliasrc ~/.config/aliasrc
ln -s ~/Documents/configs/bash-configs/profile ~/.profile
ln -s ~/Documents/configs/bash-configs/bash_profile ~/.bash_profile

# SCRIPTS
ln -s ~/Documents/configs/scripts/chunks.sh ~/bin/chunks.sh
ln -s ~/Documents/configs/scripts/before_tmux.sh ~/bin/before_tmux.sh
ln -s ~/Documents/configs/scripts/brightness ~/bin/brightness
ln -s ~/Documents/configs/scripts/reader ~/bin/reader
