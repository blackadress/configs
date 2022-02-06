 # If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Lines configured by zsh-newuser-install
export HISTCONTROL=ignoreboth:erasedups
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt extendedglob nomatch
unsetopt autocd beep notify
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/erland/.zshrc'

fpath=(/usr/share/zsh/site-functions $fpath)

# End of lines added by compinstall
#
autoload -U colors && colors

alias cp="cp -i"                        # confirm before overwriting something
alias df='df -h'                        # human-readable sizes
alias free='free -m'                    # show sizes in MB
set -o vi 								# VI navigation enabled

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

[ -f "/usr/share/fzf/key-bindings.zsh" ] && source "/usr/share/fzf/key-bindings.zsh"
[ -f "/usr/share/fzf/completion.zsh" ] && source "/usr/share/fzf/completion.zsh"

autoload -Uz compinit
zstyle ':completion:*' menu select
# Autocomplete case insensitive
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

zmodload zsh/complist
compinit
# Include hidden files on autocomplete
_comp_options+=(globdots)

# syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

# vi mode
bindkey -v

# STARSHIP start
eval "$(starship init zsh)"

# pyenv
eval "$(pyenv virtualenv-init -)"
eval "$(pyenv init -)"
# . "$HOME/.cargo/env"
