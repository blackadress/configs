#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

#RUST
export PATH="$HOME/.cargo/bin:$PATH"
#NODE JS
export PATH="$HOME/.npm-global/bin:$PATH"
#FLUTTER
export PATH="$HOME/flutter/bin:$PATH"
#RUBY
export PATH="$HOME/.gem/ruby/2.7.0/bin:$PATH"
#SCRIPTS Y BINARIOS PROPIOS
export PATH="$HOME/bin:$PATH"

export ANDROID_HOME="$HOME/Android/Sdk"

export PATH="$ANDROID_HOME/emulator:$PATH"
export PATH="$ANDROID_HOME/tools:$PATH"
export PATH="$ANDROID_HOME/tools/bin:$PATH"
export PATH="$ANDROID_HOME/platform-tools:$PATH"



if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi

