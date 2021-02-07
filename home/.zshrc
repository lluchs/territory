# ZSH configuration

source ~/territory/zplugin/zplugin.zsh

##### GRML #####
source ~/territory/grml-etc-core/etc/zsh/zshrc

# Disable the ag alias.
disable -a ag &> /dev/null

[[ -z "$SSH_AUTH_SOCK" ]] && \
	check_com keychain && eval `keychain --eval --quick --quiet`

##### PROMPT #####

# Add slurm info to the prompt.
function slurm_prompt() {
	REPLY=${SLURM_JOB_ID:+$SLURM_JOB_NODELIST }
}
grml_theme_add_token slurm -f slurm_prompt

prompt_items=(rc change-root user at host slurm path vcs)
zstyle ':prompt:grml:left:setup' items $prompt_items
zstyle ':prompt:grml:left:items:slurm' pre '%F{red}'
zstyle ':prompt:grml:left:items:slurm' post '%f'

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

alias o='xdg-open'

# Alternative to `sudoedit` which only updates files after leaving the editor.
alias Vim='sudo -E vim'

# bsdtar supports more archive formats
check_com bsdtar && alias tar=bsdtar

alias cal='cal -m'

alias nix-zsh='nix-shell --run zsh'

# Search for filenames with a regex (like ag -g)
alias rf='rg --files | rg'

# Avoid scp
alias rscp='rsync --info=progress2'

# colored ip output
alias ip='ip --color=auto'

##### FUNCTIONS #####

# Print all keys/values for a gsettings path.
function gsettings-get-all() {
	gsettings list-keys $1  | xargs -tn 1 gsettings get $1
}

##### TOOLS #####

# Use ag or rg as fzf search tool, if available.
if   check_com rg; then FZF_DEFAULT_COMMAND='rg --files'
elif check_com ag; then FZF_DEFAULT_COMMAND='ag -g ""'
fi
export FZF_DEFAULT_COMMAND

##### ZPLUGIN #####

# GitHub repositories
zplugin load zdharma/fast-syntax-highlighting
zplugin load zdharma/history-search-multi-word
