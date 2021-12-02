#!/usr/bin/env bash

cd "$HOME"
. /etc/os-release

error() {
	echo "$1" > /dev/stderr
	exit 1
}

echo -n "Installing packages "

case "$ID" in
	fedora)
		echo "for Fedora..."
		sudo dnf install -y @c-development ctags git htop ripgrep stow tmux vim-enhanced zsh \
			|| error "dnf install failed"
		;;

	arch|archarm)
		echo "for Arch Linux..."
		sudo pacman -Syu --noconfirm base-devel ctags git htop ripgrep stow tmux vim zsh \
			|| error "pacman -Syu failed"
		;;

	*)
		error "failed: unknown distribution $ID"
		;;
esac

# Change login shell to ZSH.
shell=$(getent passwd "$USER" | cut -d: -f7)
echo -n "Checking shell: $shell "
if grep -q zsh <<< "$shell"; then
	echo ok
else
	newshell=$(chsh -l | sed -n '/zsh/{p;q}')
	echo "--> $newshell"
	chsh -s "$newshell" || error "chsh failed"
fi

echo
if [[ ! -d territory ]]; then
	echo "Initializing territory..."

	git clone --recursive https://github.com/lluchs/territory || error "git clone failed"
	pushd territory
	git remote set-url --push origin git@github.com:lluchs/territory
	make stow || error "stow failed"
	popd
else
	echo "skipping territory"
fi

echo
if [[ ! -d .vim ]]; then
	echo "Initializing vimfiles..."

	git clone https://github.com/lluchs/vimfiles .vim || error "git clone failed"
	pushd .vim
	git remote set-url --push origin git@github.com:lluchs/territory
	vim -u bundles.vim +PlugInstall +qall || error "vim-plug installation failed"
	popd
fi
