# ZSH configuration

source ~/.homesick/repos/homeshick/homeshick.sh
eval `keychain --eval --quick --quiet`

##### ANTIGEN #####
source ~/.homesick/repos/territory/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle command-not-found

# GitHub repositories
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle rupa/z

# Load the theme.
antigen theme candy
# Fix prompt (24h time)
PROMPT=$'%{$fg_bold[green]%}%n@%m %{$fg[blue]%}%D{[%T]} %{$reset_color%}%{$fg[white]%}[%~]%{$reset_color%} $(git_prompt_info)\
%{$fg[blue]%}->%{$fg_bold[blue]%} %#%{$reset_color%} '


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
