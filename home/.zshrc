# ZSH configuration

source ~/.homesick/repos/homeshick/homeshick.sh

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

# Tell antigen that you're done.
antigen apply
