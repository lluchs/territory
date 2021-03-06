# i3 config file (v4)
#
# Please see http://i3wm.org/docs/userguide.html for a complete reference!

set $mod Mod4

focus_follows_mouse no

# font for window titles. ISO 10646 = Unicode
font pango:monospace 12

# Use Mouse+$mod to drag floating windows to their wanted position
floating_modifier $mod

# start a terminal
bindsym $mod+Shift+Return exec i3-sensible-terminal
bindsym $mod+Return exec alacritty -e tmux

# kill focused window
bindsym $mod+Shift+Q kill

# start program launcher (rofi or dmenu)
syscmd(`command -v rofi > /dev/null')dnl
set $launcher ifelse(sysval, `0', `rofi -show run', `dmenu_run')
bindsym $mod+d exec $launcher

# change focus
bindsym $mod+h focus left
bindsym $mod+j focus down
bindsym $mod+k focus up
bindsym $mod+l focus right

# alternatively, you can use the cursor keys:
bindsym $mod+Left focus left
bindsym $mod+Down focus down
bindsym $mod+Up focus up
bindsym $mod+Right focus right

# move focused window
bindsym $mod+Shift+H move left
bindsym $mod+Shift+J move down
bindsym $mod+Shift+K move up
bindsym $mod+Shift+L move right

# alternatively, you can use the cursor keys:
bindsym $mod+Shift+Left move left
bindsym $mod+Shift+Down move down
bindsym $mod+Shift+Up move up
bindsym $mod+Shift+Right move right

# move workspace between outputs
bindsym $mod+Ctrl+h move workspace to output left
bindsym $mod+Ctrl+j move workspace to output down
bindsym $mod+Ctrl+k move workspace to output up
bindsym $mod+Ctrl+l move workspace to output right

# split in horizontal orientation
bindsym $mod+shift+V split h

# split in vertical orientation
bindsym $mod+v split v

# enter fullscreen mode for the focused container
bindsym $mod+f fullscreen

# change container layout (stacked, tabbed, default)
bindsym $mod+s layout stacking
bindsym $mod+w layout tabbed
bindsym $mod+e layout toggle split

# toggle tiling / floating
bindsym $mod+Shift+space floating toggle

# change focus between tiling / floating windows
bindsym $mod+space focus mode_toggle

# focus the parent container
bindsym $mod+a focus parent

# focus the child container
bindsym $mod+Shift+A focus child

# switch to workspace
bindsym $mod+1 workspace 1
bindsym $mod+2 workspace 2
bindsym $mod+3 workspace 3
bindsym $mod+4 workspace 4
bindsym $mod+5 workspace 5
bindsym $mod+6 workspace 6
bindsym $mod+7 workspace 7
bindsym $mod+8 workspace 8
bindsym $mod+9 workspace 9
bindsym $mod+0 workspace 10

# move focused container to workspace
bindcode $mod+Shift+10 move container to workspace 1
bindcode $mod+Shift+11 move container to workspace 2
bindcode $mod+Shift+12 move container to workspace 3
bindcode $mod+Shift+13 move container to workspace 4
bindcode $mod+Shift+14 move container to workspace 5
bindcode $mod+Shift+15 move container to workspace 6
bindcode $mod+Shift+16 move container to workspace 7
bindcode $mod+Shift+17 move container to workspace 8
bindcode $mod+Shift+18 move container to workspace 9
bindcode $mod+Shift+19 move container to workspace 10

# scratch
bindsym $mod+Shift+x move scratchpad
bindsym $mod+x scratchpad show

# reload the configuration file
bindsym $mod+Shift+C reload
# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym $mod+Shift+R restart
# exit i3 (logs you out of your X session)
bindsym $mod+Shift+E exit

# resize window (you can also use the mouse for that)
mode "resize" {
        # These bindings trigger as soon as you enter the resize mode

        # Pressing left will shrink the window’s width.
        # Pressing right will grow the window’s width.
        # Pressing up will shrink the window’s height.
        # Pressing down will grow the window’s height.
        bindsym j resize shrink width 10 px or 10 ppt
        bindsym k resize grow height 10 px or 10 ppt
        bindsym l resize shrink height 10 px or 10 ppt
        bindcode 47 resize grow width 10 px or 10 ppt

        # same bindings, but for the arrow keys
        bindsym 113 resize shrink width 10 px or 10 ppt
        bindsym 116 resize grow height 10 px or 10 ppt
        bindsym 111 resize shrink height 10 px or 10 ppt
        bindsym 114 resize grow width 10 px or 10 ppt

        # back to normal: Enter or Escape
        bindsym Return mode "default"
        bindsym Escape mode "default"
}

bindsym $mod+r mode "resize"

# Suspend
bindsym $mod+shift+S exec i3lock && systemctl suspend

# Volume control
bindsym XF86AudioLowerVolume exec pactl set-sink-volume @DEFAULT_SINK@ '-5%'
bindsym XF86AudioRaiseVolume exec pactl set-sink-volume @DEFAULT_SINK@ '+5%'
bindsym XF86AudioMute        exec pactl set-sink-mute @DEFAULT_SINK@ toggle
bindsym $mod+c exec pavucontrol

# Screen brightness controls
bindsym XF86MonBrightnessUp exec light -A 10
bindsym XF86MonBrightnessDown exec light -U 10

# xrandr shortcut
# The screen configuration button on Dell laptops is an alias for Win+P.
bindsym $mod+p exec ~/territory/bin/monitorcfg

# KeePass
bindsym ctrl+alt+a exec keepass --auto-type

# Mouse configuration

# The middle button over a titlebar kills the window
bindsym --release Mod2+button2 kill
bindsym --release button2 kill

# The right button toggles floating
bindsym $mod+button3 floating toggle

# The side buttons move the window around
bindsym Mod2+button9 move left
bindsym Mod2+button8 move right

ifdef(`custom_bar', `# (configuration with custom bar)', `
# Start i3bar to display a workspace bar (plus the system information i3status
# finds out, if available)
bar {
        font pango:monospace 12
        status_command i3status -c ~/.i3/i3status.conf
}
')

# vim: ft=i3.m4
