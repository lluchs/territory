# ZSH configuration

source ~/territory/zplugin/zplugin.zsh

##### GRML #####
source ~/territory/grml-etc-core/etc/zsh/zshrc

# Disable the ag alias.
disable -a ag &> /dev/null

check_com keychain && eval `keychain --eval --quick --quiet`

##### KEYBINDINGS #####

# Use vi bindings.
bindkey -v

# jk -> Esc
bindkey -M viins 'jk' vi-cmd-mode

# Multiline editing
bindkey '^x' push-line-or-edit

# Incremental search like emacs mode
#bindkey '^r' history-incremental-search-backward
#bindkey '^s' history-incremental-search-forward

# Beginning search with <A-p> and <A-n>
bindkey '\ep' history-beginning-search-backward
bindkey '\en' history-beginning-search-forward

##### ALIASES #####

# Alternative to `sudoedit` which only updates files after leaving the editor.
alias Vim='sudo -E vim'

# bsdtar supports more archive formats
check_com bsdtar && alias tar=bsdtar

alias cal='cal -m'

##### ZPLUGIN #####

# GitHub repositories
zplugin load zdharma/fast-syntax-highlighting
zplugin load zdharma/history-search-multi-word
zplugin load rupa/z
