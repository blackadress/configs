
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.npm-global/bin:$PATH"
export PATH="$HOME/bin:$PATH"

# MPD daemon start (if no other user instance exists)
[ ! -s ~/.config/mpd/pid ] && mpd
