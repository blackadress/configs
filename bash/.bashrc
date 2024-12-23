#
# ~/.bashrc
#
export LANG=en_US.UTF-8
export LC_MESSAGES="C"
export EDITOR="nvim"
[[ $- != *i* ]] && return

[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

use_color=true

alias cp="cp -i"                        # confirm before overwriting something
alias df='df -h'                        # human-readable sizes
alias free='free -m'                    # show sizes in MB
set -o vi 								# VI navigation enabled
bind -m vi-insert "\C-l":clear-screen

shopt -s checkwinsize

shopt -s expand_aliases

# Enable history appending instead of overwriting.  #139609
shopt -s histappend

#
# # ex - archive extractor
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# aliases
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

[ -f "/usr/share/fzf/key-bindings.bash" ] && source "/usr/share/fzf/key-bindings.bash"
[ -f "/usr/share/fzf/completion.bash" ] && source "/usr/share/fzf/completion.bash"

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTCONTROL=ignoreboth:erasedups
HISTSIZE=10000
HISTFILESIZE=20000

# config de STARSHIP
eval "$(starship init bash)"

# pyenv
eval "$(pyenv virtualenv-init -)"
eval "$(pyenv init -)"
. "$HOME/.cargo/env"
export PATH="$PATH:$HOME/.spicetify"
