#!/bin/bash

# PROGRAMAS
# configuracion nvim
ln -sf ~/Documents/configs/nvim/init.vim ~/.config/nvim/init.vim
# configuracion tmux
ln -sf ~/Documents/configs/tmux/tmux.conf ~/.tmux.conf
## script de utilidad para tmux
#ln -sf ~/Documents/configs/scripts/ide ~/bin/ide

# configuracion terminal alacritty
ln -sf ~/Documents/configs/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
# flux configs
ln -sf ~/Documents/configs/scripts/xflux_setup.sh ~/bin/xflux_setup.sh
ln -sf ~/Documents/configs/scripts/xflux_stop.sh ~/bin/xflux_stop.sh

# BASH CONFIGS
ln -sf ~/Documents/configs/bash-configs/bashrc ~/.bashrc
ln -sf ~/Documents/configs/bash-configs/aliasrc ~/.config/aliasrc
ln -sf ~/Documents/configs/bash-configs/profile ~/.profile
ln -sf ~/Documents/configs/bash-configs/bash_profile ~/.bash_profile

# SCRIPTS
ln -sf ~/Documents/configs/scripts/chunks.sh ~/bin/chunks.sh
ln -sf ~/Documents/configs/scripts/before_tmux.sh ~/bin/before_tmux.sh

