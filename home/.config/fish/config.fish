# Fish configuration

fish_vi_key_bindings
# jk to insert normal mode
bind -M insert jk 'set fish_bind_mode default; commandline -f backward-char force-repaint'
# merge history from other fish instances on empty command line
bind -M insert \r 'test -z "$(commandline)" && history --merge; commandline -f execute'

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

set fish_greeting

# Aliases

abbr --add o xdg-open

abbr --add nixs --set-cursor nix shell nixpkgs#%
abbr --add nixr --set-cursor nix run nixpkgs#%
abbr --add nixd nix develop -c \$SHELL
