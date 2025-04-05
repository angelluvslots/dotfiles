alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias df='dotfiles'

alias rebuild='sudo nixos-rebuild switch --flake $HOME/nixos#angel'
alias rb='rebuild'
