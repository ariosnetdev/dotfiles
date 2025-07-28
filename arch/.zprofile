export PATH="$PATH:/home/arios/.local/bin"
export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/ssh-agent.socket

# start window manager
if [ -z "$WAYLAND_DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ] ; then
    exec sway --unsupported-gpu
fi

