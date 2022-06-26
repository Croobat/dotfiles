export skip_global_compinit=1

# main xdg paths
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

# home files
export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export HISTFILE=$XDG_STATE_HOME/zsh/history
export LESSHISTFILE=$XDG_DATA_HOME/lesshst
export PULSE_COOKIE=$XDG_DATA_HOME/pulseaudio/pulse-cookie
export WINEPREFIX="$XDG_DATA_HOME"/wineprefixes/default
