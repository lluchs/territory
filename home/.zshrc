# ZSH configuration

source ~/.homesick/repos/homeshick/homeshick.sh

##### GRML #####
source ~/.homesick/repos/territory/grml-etc-core/etc/zsh/zshrc

check_com keychain && eval `keychain --eval --quick --quiet`

##### ANTIGEN #####
source ~/.homesick/repos/territory/antigen/antigen.zsh

# GitHub repositories
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle rupa/z

# Tell antigen that you're done.
antigen apply

##### KEYBINDINGS #####

# Use vi bindings.
bindkey -v

# jk -> Esc
bindkey -M viins 'jk' vi-cmd-mode

# Multiline editing
bindkey '^x' push-line-or-edit

# Incremental search like emacs mode
bindkey '^r' history-incremental-search-backward
bindkey '^s' history-incremental-search-forward

# Beginning search with <A-p> and <A-n>
bindkey '\ep' history-beginning-search-backward
bindkey '\en' history-beginning-search-forward

##### ALIASES #####

# Alternative to `sudoedit` which only updates files after leaving the editor.
alias Vim='sudo -E vim'

##### LOCAL CONFIGURATION #####

[[ -f $HOME/.zshrc.local ]] && . $HOME/.zshrc.local
