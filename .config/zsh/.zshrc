# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
# export LS_COLORS="$LS_COLORS:ow=1;34:tw=1;34:"
export ZSH="$HOME/.config/zsh/.oh-my-zsh"

# Add ruby to path
# export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
# export PATH="$PATH:$GEM_HOME/bin"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="random"
ZSH_THEME="xiong-chiamiov-plus"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
 HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
 zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
 zstyle ':omz:update' frequency 7

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    archlinux
    zsh-autosuggestions
    zsh-history-substring-search
    you-should-use
    auto-notify
    zsh-syntax-highlighting
)

# NTFS ugly highlight fix
eval $(dircolors -b ~/.config/zsh/.zsh_dir_colors)

######################
# USER CONFIGURATION #
######################

# Auto notify plugin
AUTO_NOTIFY_IGNORE+=(
  "ranger" "ra" "find" "rofi" "sncli" "zathura" "joplin" "vim" "nvim" "less" "more" "man" "tig" "watch" "git commit" "top" "htop" "ssh" "nano" "zconf" "su"
)
zstyle ':notify:*' command-complete-timeout 180
zstyle ':notify:*' error-log /dev/null
zstyle ':notify:*' always-check-active-window no
zstyle ':notify:*' expire-time 1000

ZSH_DISABLE_COMPFIX=true

source $ZSH/oh-my-zsh.sh

## Emacs mode
bindkey -e

## Up navigation function
up () {
    local d=""
    local limit="$1"

    # Default to limit of 1
    if [ -z "$limit" ] || [ "$limit" -le 0 ]; then
        limit=1
    fi

    for ((i=1;i<=limit;i++)); do
        d="../$d"
    done

    # perform cd. Show errors if cd fails
    if ! cd "$d"; then
        echo "Couldn't go up $limit dirs.";
    fi
}

######################
#      ALIASES       #
######################

## Basic aliases
# ls
alias ls='ls -hF --color=auto'
alias lr='ls -R'                    # recursive ls
alias ll='ls -l'
alias la='ll -A'
alias lx='ll -BX'                   # sort by extension
alias lz='ll -rS'                   # sort by size
alias lt='ll -rt'                   # sort by date
alias lm='la | more'
alias ln='ln -i'

# Safety features
alias rm='rm -I'                    # 'rm -i' prompts for every file
alias rmr='rm -rfI'

# Permissions
alias chown='chown --preserve-root'
alias chx='chmod --preserve-root u+x'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
alias cls=' echo -ne "\033c"'       # clear screen for real (it does not work in Terminology)

# Pacman
alias pacinn="sudo pacman -S --needed"
alias yainn="yay -S --needed"
alias yainch="yay -S --mflags \"--skipchecksums --skippgpcheck\""
alias installed="pacman -Qqet > .pkglist.txt ; less .pkglist.txt"
alias findar="pacman -Slq | fzf -m --preview 'cat <(pacman -Si {1}) <(pacman -Fl {1} | awk \"{print \$2}\")' | xargs -ro sudo pacman -S"
alias findaur="yay -Slq | fzf -m --preview 'cat <(yay -Si {1}) <(yay -Fl {1} | awk \"{print \$2}\")\' | xargs -ro  yay -S"

## Modified commands
alias diff='colordiff'
alias grep='grep --color=auto'
alias more='less'
alias df='df -h'
alias du='du -c -h'
alias mkdir='mkdir -p -v'
alias nano='nano -w'
alias ping='ping -c 3'
alias dmesg='dmesg -HL'
alias hist="history | less"
alias t="trash"
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias gslog='git slog'
alias dwcomp='rm ~/.config/dwm/config.h ; sudo make clean install'
alias installed-packages='pacman -Qqe > ~/.config/pkglist.txt'
alias youtube-dl-playlist-guardar="youtube-dl -x -f bestaudio --external-downloader aria2c --external-downloader-args '-c -j 3 -x 3 -s 3 -k 1M' --ignore-errors --continue --audio-format mp3 'https://www.youtube.com/playlist?list=PLjp-ryEOLdtOGhSXXc2-3VRoyK8uVUjF2'"
alias youtube-dl-playlist="youtube-dl -x -f bestaudio --external-downloader aria2c --external-downloader-args '-c -j 3 -x 3 -s 3 -k 1M' --ignore-errors --continue --no-overwrites --audio-format mp3"
alias android-mount='aft-mtp-mount ~/.mnt'
alias android-umount='fusermount -uz ~/.mnt'
alias svn="svn --config-dir \"$XDG_CONFIG_HOME\"/subversion"
alias gitfetch="onefetch"
alias upgrade="yay -Syu --combinedupgrade"
alias lgit="lazygit"
alias firefoxserver="live-server --browser=firefox"
alias chromeserver="live-server --browser=google-chrome-stable"
alias quteserver="live-server --browser=qutebrowser"
alias unzip="unzip -d ./zip"


# App aliases
alias vim="nvim"
alias vi="nvim -u NONE"
alias code="vscodium"
alias spt="ncspot"
alias getcolor="chameleon"
alias sn="sncli -c $HOME/.config/sncli/snclirc"
alias binds="sxhkd"
alias bm="bashmount"
alias scim="sc-im"
alias todo="topydo add"
alias todid="topydo do"
alias todos="topydo ls"
alias td="topydo"
alias 2048="2048 bluered"
alias ra="ranger"


# conf aliases
alias zconf="vim ~/.config/zsh/.zshrc"
alias piconf="vim ~/.config/picom/picom.conf"
alias alaconf="vim ~/.config/alacritty/alacritty.yml"
alias bindsconf="vim ~/.config/sxhkd/sxhkdrc"
alias quteconf="vim ~/.config/qutebrowser/config.py"
alias qutemarks="vim ~/.config/qutebrowser/quickmarks"
alias qutequick="vim ~/.config/qutebrowser/quickmarks"
alias xinit="vim ~/.config/X11/xinitrc"

alias dwconf="cd ~/.config/dwm"
alias rangerconf="cd ~/.config/ranger"
alias vimconf="cd ~/.config/nvim"
alias packerconf="cd ~/.local/share/nvim/site/pack/packer"

# location aliases
alias desk="cd /usr/share/applications"
alias platzi="cd ~/Developer/platzi"
alias wdev="cd ~/Developer/web-dev"


## New commands
alias du1='du --max-depth=1'
alias histf='history | grep'         # requires an argument
alias openports='ss --all --numeric --processes --ipv4 --ipv6'
alias pgg='ps -Af | grep'           # requires an argument
alias ..='cd ..'

# Privileged access
alias scat='sudo cat'
alias svim='sudo nvim'
alias root='sudo -i'
alias reboot='sudo systemctl reboot'
alias poweroff='sudo systemctl poweroff'
alias update='sudo pacman -Su'
alias netctl='sudo netctl'
alias nethogs='sudo nethogs'
alias updatedb='sudo updatedb --verbose'

## Make Bash error tolerant
alias :q=' exit'
alias :Q=' exit'
alias :x=' exit'
alias cd..='cd ..'

## Media
alias playwav='mpv *.wav'
alias playogg='mpv *.ogg'
alias playmp3='mpv *.mp3'

alias playavi='vlc *.avi'
alias playmov='vlc *.mov'
alias playmp4='vlc *.mp4'
alias playflv='vlc *.flv'
alias playmkv='vlc *.mkv'
