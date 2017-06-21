include(`common/.i3/config')

# Start i3bar to display a workspace bar (plus the system information i3status
# finds out, if available)
bar {
        font pango:monospace 12
        status_command i3status -c ~/.i3/i3status.conf
}

# Autostart
exec --no-startup-id xss-lock -- i3lock-pixeled -n

# vim: ft=i3.m4