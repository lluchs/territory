# Fish configuration

# Use universal variables to transfer SSH_AUTH_SOCK to tmux sessions.
if set -q SSH_AUTH_SOCK
  set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
  set -e SSH_AUTH_SOCK
end

fish_vi_key_bindings
bind -M insert jk 'set fish_bind_mode default; commandline -f backward-char force-repaint'

set fish_color_command green
set fish_color_operator brblue --bold
set fish_color_param brblue
set fish_color_comment brblack
set fish_color_error brred --bold
set fish_color_quote yellow
set fish_color_escape cyan
set fish_color_redirection magenta
set fish_color_end brred

set fish_color_host normal
set fish_color_user brblue --bold
set fish_color_cwd white --bold
