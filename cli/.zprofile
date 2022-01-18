if [[ -z "${DISPLAY}" && "$(tty)" == '/dev/tty1' && "$USER" != 'root' ]]; then
	exec startx
fi
