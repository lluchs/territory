path=($HOME/territory/bin $HOME/.local/bin $HOME/.cargo/bin $path)
fpath=($fpath $HOME/territory/zsh/completion)

# Sets ninja output to [pending → running → finished]
export NINJA_STATUS="[%u→%r→%f] "

[ -f ~/.zshenv.local ] && . ~/.zshenv.local
