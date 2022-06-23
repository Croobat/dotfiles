if [[ "$(tty)" = "/dev/tty1" ]]; then
	pgrep dwm || exec startx ~/.config/X11/xinitrc
fi
