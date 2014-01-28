# Fish configuration

# Use universal variables to transfer SSH_AUTH_SOCK to tmux sessions.
if set -q SSH_AUTH_SOCK
  set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
  set -e SSH_AUTH_SOCK
end
