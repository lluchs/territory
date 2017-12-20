include(`common/.i3/config.m4')

# Workspace configuration
set $primary_monitor HDMI-0
set $secondary_monitor DVI-I-1
workspace 1 output $primary_monitor
workspace 3 output $primary_monitor
workspace 5 output $primary_monitor
workspace 7 output $primary_monitor
workspace 9 output $primary_monitor
workspace 2 output $secondary_monitor
workspace 4 output $secondary_monitor
workspace 6 output $secondary_monitor
workspace 8 output $secondary_monitor

assign [class="Vivaldi"] → 1
assign [class="Pidgin" window_role="buddy_list"] → 8
assign [class="Pidgin" window_role="conversation"] → 2
assign [class="Steam" title="^Steam$"] → 6
assign [class="Steam" title="^Friends$"] → 8
assign [class="Steam" title="- Chat$"] → 2

# Start i3bar to display a workspace bar (plus the system information i3status
# finds out, if available)
bar {
        output $primary_monitor
        font pango:monospace 20
        status_command i3status -c ~/.i3/i3status.conf
}

bar {
        output $secondary_monitor
        font pango:monospace 10
        status_command i3status -c ~/.i3/i3status.conf
}

# Autostart
# ibus-daemon for keyboard layouts
#exec ibus-daemon
# Required for GNOME Keyring
#exec --no-startup-id /usr/lib/gnome-settings-daemon/gnome-settings-daemon
#exec ~/wm-init.sh
exec lxqt-policykit-agent

# vim: ft=i3.m4
