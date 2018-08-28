path=($path $HOME/territory/bin)
fpath=($fpath $HOME/territory/zsh/completion)

# Sets ninja output to [pending → running → finished]
export NINJA_STATUS="[%u→%r→%f] "

[ -f ~/.zshenv.local ] && . ~/.zshenv.local
