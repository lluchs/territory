# i3status configuration file.
# see "man i3status" for documentation.

# It is important that this file is edited as UTF-8.
# The following line should contain a sharp s:
# ß
# If the above line is not correctly displayed, fix your editor first!

general {
        colors = true
        interval = 5
}

order += "ipv6"
order += "disk /"
#order += "run_watch DHCP"
#order += "run_watch VPN"
ifdef(`have_wireless', `order += "wireless _first_"')
order += "ethernet _first_"
ifdef(`have_battery', `order += "battery 0"')
ifdef(`cpu_temperature_id', `order += "cpu_temperature cpu_temperature_id"')
order += "load"
order += "volume master"
order += "tztime local"

wireless _first_ {
        format_up = "W: (%quality at %essid) %ip"
        format_down = "W: down"
}

ethernet _first_ {
        # if you use %speed, i3status requires root privileges
        format_up = "E: %ip (%speed)"
        format_down = "E: down"
}

battery 0 {
        format = "%status %consumption %percentage %remaining"
        status_chr = "⚡"
}

cpu_temperature cpu_temperature_id {
        format = "%degrees°C"
}

run_watch DHCP {
        pidfile = "/var/run/dhclient*.pid"
}

run_watch VPN {
        pidfile = "/var/run/vpnc/pid"
}

tztime local {
        format = "%Y-%m-%d %H:%M"
}

load {
        format = "%1min"
}

volume master {
        format = "%volume"
        device = "default"
        mixer = "Master"
        mixer_idx = 0
}

disk "/" {
        format = "%avail"
}

# vim: ft=conf.m4
